require 'test_helper'

class API::LaundriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laundry = laundries(:laundry)
  end

  test 'should get index' do
    get api_laundries_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_laundry_path(@laundry, api_token: api_token)
    assert_response :success
  end
end
