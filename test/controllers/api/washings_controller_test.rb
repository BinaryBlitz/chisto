require 'test_helper'

class API::WashingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @washing = washings(:washing)
  end

  test 'should get index' do
    get api_washings_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_washing_path(@washing, api_token: api_token)
    assert_response :success
  end
end
