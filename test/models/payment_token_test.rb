require 'test_helper'

class PaymentTokenTest < ActiveSupport::TestCase
  setup do
    @payment_token = payment_tokens(:payment_token)
  end

  test 'payment data is present' do
    @payment_token.payment_data = nil
    assert @payment_token.invalid?
  end
end
