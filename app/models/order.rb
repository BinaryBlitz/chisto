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
#

class Order < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :laundry

  has_one :payment, dependent: :destroy
  has_many :order_items, dependent: :destroy, inverse_of: :order
  has_many :order_treatments, through: :order_items
  has_many :statuses, dependent: :destroy

  enum status: %i(processing confirmed cleaning dispatched completed canceled)
  enum payment_method: %i(card cash apple_pay)

  validates :street_name, :house_number, :apartment_number, :contact_number, presence: true
  validates :order_items, presence: true
  validates :email, email: true

  before_create :set_delivery_fee
  before_create :set_total_price
  before_save :build_status

  accepts_nested_attributes_for :order_items

  scope :paid, -> { where(paid: true) }
  # TODO: add tests
  scope :visible, -> { where.not(payment_method: :card).or(card.paid) }

  def payment
    return if cash? || apple_pay?

    super || create_payment(amount: total_price)
  end

  def paid!
    return if paid?

    ActiveRecord::Base.transaction do
      update_column(:paid, true)
    end
  end

  def address
    "Улица #{street_name}, дом #{house_number}, квартира #{apartment_number}"
  end

  def order_items_price
    @order_items_price ||= order_items.inject(0) { |sum, order_item| sum + order_item.total_price }
  end

  private

  def set_delivery_fee
    self.delivery_fee = laundry.delivery_fee if order_items_price < laundry.free_delivery_from
  end

  def set_total_price
    self.total_price = order_items_price + delivery_fee
  end

  def build_status
    return unless status_changed?
    statuses.build(state: status)
  end
end
