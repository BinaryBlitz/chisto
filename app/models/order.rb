# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  laundry_id       :integer
#  status           :integer          default("processing")
#  paid             :boolean          default(FALSE)
#  street_name      :string
#  house_number     :string
#  apartment_number :string
#  contact_number   :string
#  notes            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  email            :string
#  total_price      :integer          not null
#  delivery_fee     :integer          default(0)
#  collection_date  :datetime
#  delivery_date    :datetime
#  payment_method   :integer          default("card")
#  promo_code_id    :integer
#

class Order < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :laundry
  belongs_to :promo_code, optional: true

  has_one :payment, dependent: :destroy
  has_one :payment_token, dependent: :destroy
  has_many :order_items, dependent: :destroy, inverse_of: :order
  has_many :order_treatments, through: :order_items
  has_many :statuses, dependent: :destroy

  # Enums
  enum status: %i[processing confirmed cleaning dispatched completed canceled]
  enum payment_method: %i[card cash apple_pay]

  # Validations
  validates :street_name, :house_number, :apartment_number, :contact_number, presence: true
  validates :order_items, presence: true
  validates :email, email: true
  validates :contact_number, phone: true
  # TODO: add foreign key
  validates :promo_code, presence: true, if: -> { promo_code_id.present? }
  validate :promo_code_is_valid, on: :create, if: -> { promo_code.present? }

  # Callbacks
  before_validation :normalize_contact_number
  before_create :set_delivery_fee
  before_create :set_total_price
  before_save :build_status

  after_create :redeem_promo_code, if: :cash?
  after_create :notify, if: :cash?

  after_save -> { user.update_counter_cache }
  after_destroy -> { user.update_counter_cache }

  accepts_nested_attributes_for :order_items

  # Scopes
  scope :paid, -> { where(paid: true) }
  # TODO: add tests
  scope :visible, -> { where(payment_method: :cash).or(card.paid).or(apple_pay.paid) }

  def payment
    return if cash? || apple_pay?

    super || create_payment(amount: total_price)
  end

  def paid!
    return if paid?

    ActiveRecord::Base.transaction do
      update_column(:paid, true)
      redeem_promo_code
      notify
    end
  end

  def address
    "#{street_name}, дом #{house_number}, квартира #{apartment_number}"
  end

  def order_items_price
    @order_items_price ||= order_items.inject(0) { |sum, order_item| sum + order_item.total_price }
  end

  # Absolute discount: -100
  def promo_code_discount
    total_price - order_items_price - delivery_fee
  end

  private

  def redeem_promo_code
    return unless promo_code.present?

    promo_code.redeem!
    user.update_attribute(:first_time_promo_code_used, true) if promo_code.first_time_only?
  end

  def set_delivery_fee
    self.delivery_fee = laundry.delivery_fee if order_items_price < laundry.free_delivery_from
  end

  def set_total_price
    self.total_price = (order_items_price + delivery_fee) * promo_code_multiplier
  end

  def build_status
    return unless status_changed?
    statuses.build(state: status)
  end

  # 15% discount = 0.85 multiplier
  def promo_code_multiplier
    return 1.0 unless promo_code.present?

    (100 - promo_code.discount) / 100.0
  end

  def promo_code_is_valid
    errors.add(:promo_code, 'has expired') if promo_code.expired?

    if !promo_code.reusable && promo_code.redeemed?
      errors.add(:promo_code, 'is already redeemed')
    end

    if promo_code.first_time_only? && user&.first_time_promo_code_used?
      errors.add(:promo_code, 'can only be activated once')
    end
  end

  def notify
    # Send emails
    OrderMailer.partner_order_email(self).deliver_later
    OrderMailer.admin_order_email(self).deliver_later
    # Notify the partner with an SMS
    NewOrderNotificationJob.perform_later(self) if laundry.phone_number.present?
  end

  def normalize_contact_number
    return unless contact_number
    self.contact_number = Phonelib.parse(contact_number).e164
  end
end
