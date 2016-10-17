require 'test_helper'

class API::CitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city = cities(:city)
  end

  test 'should get index' do
    get api_cities_path(api_token: api_token)
    assert_response :success
  end
end
