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
#

class Order < ApplicationRecord
  STATUS_MESSAGES = {
    'confirmed' => 'Вы согласовали дату и время забора вещей. Ожидайте курьера.',
    'cleaning' => 'Ваши вещи уехали в чистку! Не беспокойтесь, скоро они вернутся!',
    'dispatched' => 'Чистые и свежие вещи уже едут к вам!',
    'completed' => 'Надеемся вы остались довольны! Пожалуйста оцените вашего исполнителя.'
  }

  belongs_to :user, counter_cache: true
  belongs_to :laundry

  has_one :payment, dependent: :destroy
  has_many :line_items, dependent: :destroy, inverse_of: :order

  enum status: %i(processing confirmed cleaning dispatched completed canceled)

  validates :street_name, :house_number, :apartment_number, :contact_number, presence: true
  validates :line_items, presence: true
  validates :email, email: true

  before_create :calculate_total_price
  before_save :notify

  accepts_nested_attributes_for :line_items

  def payment
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

  # Grouping: [item, quantity] => [line_items]
  def grouped_line_items
    line_items.group_by do |line_item|
      [line_item.laundry_treatment.treatment.item, line_item.quantity]
    end
  end

  private

  def calculate_total_price
    self.total_price = line_items.inject(0) { |sum, line_item| sum + line_item.total_price }
  end

  def notify
    return unless status_changed?

    message = STATUS_MESSAGES[status]
    return unless message

    Notifier.new(user, message, order_id: id)
  end
end
