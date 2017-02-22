require 'test_helper'

class API::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:item)
    @category = @item.category
  end

  test 'should get index' do
    get api_items_path
    assert_response :success
  end

  test 'should get category index' do
    get api_category_items_path(@category)
    assert_response :success
  end
end
