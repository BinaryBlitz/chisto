require 'test_helper'

class API::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:order)
    @laundry = @order.laundry
    @order_item = @order.order_items.first
    @order_treatment = @order_item.order_treatments.first
  end

  test 'should get index' do
    get api_orders_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_order_path(@order, api_token: api_token)
    assert_response :success
  end

  test 'should create order' do
    assert_difference 'Order.count' do
      post api_laundry_orders_path(@laundry, api_token: api_token), params: {
        order: @order.attributes.merge(
          order_items_attributes: [
            @order_item.attributes.merge(order_treatments_attributes: [@order_treatment.attributes])
          ]
        )
      }
    end

    assert_response :created
  end
end
