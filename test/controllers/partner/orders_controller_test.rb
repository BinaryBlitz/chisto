require 'test_helper'

class Partner::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'partner.domain.com'
    sign_in_laundry
    @order = orders(:order)
  end

  test 'should get index' do
    get partner_orders_path
    assert_response :success
  end
end
