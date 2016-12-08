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

  test 'should update order' do
    new_status = Order.statuses.keys.last
    patch partner_order_path(@order), params: { order: { status: new_status } }
    assert_redirected_to partner_order_path(@order)
    assert_equal new_status, @order.reload.status
  end
end
