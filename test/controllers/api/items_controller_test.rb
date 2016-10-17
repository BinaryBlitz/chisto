require 'test_helper'

class API::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:item)
    @category = @item.category
  end

  test 'should get index' do
    get api_category_items_path(@category, api_token: api_token)
    assert_response :success
  end
end
