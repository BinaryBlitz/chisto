require 'test_helper'

class API::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:order)
    @laundry = @order.laundry
    @line_item = @order.line_items.first
  end

  test 'should get index' do
    get api_orders_path(api_token: api_token)
    assert_response :success
  end

  test 'should create order' do
    assert_difference 'Order.count' do
      post api_laundry_orders_path(@laundry, api_token: api_token), params: {
        order: @order.attributes.merge(line_items_attributes: [@line_item.attributes])
      }
    end

    assert_response :created
  end
end
