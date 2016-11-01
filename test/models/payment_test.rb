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

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  setup do
    @payment = payments(:payment)
  end

  test 'amount is positive' do
    @payment.amount = 0
    assert @payment.invalid?
  end
end
