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
end
