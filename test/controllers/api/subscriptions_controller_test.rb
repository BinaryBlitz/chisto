require 'test_helper'

class API::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:subscription)
  end

  test 'should create subscription' do
    assert_difference 'Subscription.count' do
      post api_subscriptions_path, params: {
        subscription: @subscription.attributes
      }
    end

    assert_response :created
  end
end
