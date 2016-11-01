# == Schema Information
#
# Table name: payments
#
#  id          :integer          not null, primary key
#  order_id    :integer
#  amount      :integer          not null
#  paid        :boolean          default(FALSE)
#  payment_url :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Payment < ApplicationRecord
  KOPEKS_IN_RUBLE = 100

  belongs_to :order

  validates :amount, numericality: { greater_than: 0 }

  after_create :init

  private

  def init
    response = Tinkoff::Client.init(amount_in_kopeks, order_id, { email: 'foo@bar.com' })
    update_attribute(:payment_url, response.payment_url)
  end

  def amount_in_kopeks
    amount * 100
  end
end
