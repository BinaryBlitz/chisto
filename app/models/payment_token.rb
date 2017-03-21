# == Schema Information
#
# Table name: payment_tokens
#
#  id                   :integer          not null, primary key
#  paid                 :boolean          default(FALSE)
#  payment_data         :jsonb            not null
#  response             :jsonb
#  order_id             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  encoded_payment_data :text             not null
#

class PaymentToken < ApplicationRecord
  belongs_to :order

  validates :encoded_payment_data, presence: true
  validates :payment_data, presence: true
  validates :order, uniqueness: true
  validate :payment_method_is_apple_pay

  before_validation :decode_payment_data, on: :create
  after_commit :pay, on: :create

  private

  def pay
    client = PaytureClient.new(encoded_payment_data, order_id: order_id)
    return unless client.pay

    ActiveRecord::Base.transaction do
      update_columns(paid: true, response: client.response)
      order.paid!
      # Order#update_columns in Order#paid! method does not reload the order
      order.touch
    end
  end

  def decode_payment_data
    return unless encoded_payment_data.present?

    decoded_payment_data = Base64.decode64(encoded_payment_data)
    self.payment_data = JSON(decoded_payment_data)
  end

  def payment_method_is_apple_pay
    return if order&.apple_pay?
    errors.add(:order, 'should use apple_pay payment method')
  end
end
