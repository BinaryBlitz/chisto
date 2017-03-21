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

  after_create :pay

  private

  def pay
    client = PaytureClient.new(payment_data)
    return unless client.pay

    ActiveRecord::Base.transaction do
      update_columns(paid: true, response: client.response)
      order.paid!
    end
  end
end
