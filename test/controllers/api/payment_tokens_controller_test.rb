require 'test_helper'

class API::PaymentTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_token = payment_tokens(:payment_token)
    @order = @payment_token.order
  end

  test 'should create payment token' do
    @payment_token.destroy

    assert_difference 'PaymentToken.count' do
      post api_order_payment_token_path(@order, api_token: api_token), params: {
        payment_token: @payment_token.attributes
      }
    end
    assert_response :created
  end
end
