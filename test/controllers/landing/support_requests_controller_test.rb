require 'test_helper'

class Landing::SupportRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @support_request = support_requests(:support_request)
  end

  test 'should get contact page' do
    get contact_path
    assert_response :success
  end

  test 'should create support request' do
    assert_difference 'SupportRequest.count' do
      post landing_support_requests_path, params: {
        support_request: @support_request.attributes
      }
    end
    assert_redirected_to contact_path
  end
end
