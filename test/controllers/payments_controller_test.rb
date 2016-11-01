require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:payment)
  end

  test 'should render OK if payment was successful' do
    post payments_path, params: { 'Success' => true, 'OrderId' => @payment.order_id }
    assert_response :ok
    assert_equal 'OK', response.body
  end
end
