require 'test_helper'

class Partner::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:order)
  end

  # TODO: set up subdomain testing
  test 'should get index' do
    skip
    get partner_orders_path
    assert_response :success
  end
end
