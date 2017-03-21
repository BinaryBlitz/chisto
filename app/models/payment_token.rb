# == Schema Information
#
# Table name: payment_tokens
#
#  id           :integer          not null, primary key
#  paid         :boolean          default(FALSE)
#  payment_data :jsonb            not null
#  response     :jsonb
#  order_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PaymentToken < ApplicationRecord
  belongs_to :order

  validates :payment_data, presence: true
  validates :order, uniqueness: true
  validate :payment_method_is_apple_pay

  after_create :pay

  private

  def pay
    client = PaytureClient.new(payment_data, order_id: order_id)
    return unless client.pay

    ActiveRecord::Base.transaction do
      update_columns(paid: true, response: client.response)
      order.paid!
    end
  end

  def payment_method_is_apple_pay
    return if order&.apple_pay?
    errors.add(:order, 'should use apple_pay payment method')
  end
end
