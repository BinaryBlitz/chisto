require 'test_helper'

class PaymentTokenTest < ActiveSupport::TestCase
  setup do
    @payment_token = payment_tokens(:payment_token)
  end

  test 'payment data is present' do
    @payment_token.payment_data = nil
    assert @payment_token.invalid?
  end

  test 'payment method is apple pay' do
    @payment_token.order.payment_method = :card
    assert @payment_token.invalid?
  end
end
