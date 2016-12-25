require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'admin.domain.com'
    sign_in_admin
    @order = orders(:order)
  end

  test 'should get index' do
    get admin_orders_path
    assert_response :success
  end

  test 'should update order' do
    new_status = Order.statuses.keys.last
    patch admin_order_path(@order), params: { order: { status: new_status } }
    assert_redirected_to admin_order_path(@order)
    assert_equal new_status, @order.reload.status
  end
end
