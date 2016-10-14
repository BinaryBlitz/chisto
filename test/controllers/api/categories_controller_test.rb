require 'test_helper'

class API::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:category)
  end

  test 'should get index' do
    get api_categories_path(api_token: api_token)
    assert_response :success
  end
end
