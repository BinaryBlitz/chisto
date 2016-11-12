require 'test_helper'

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'admin.domain.com'
    sign_in_admin
    @item = items(:item)
    @category = @item.category
  end

  test 'should get index' do
    get admin_category_items_path(@category)
    assert_response :success
  end

  test 'should create item' do
    @item.destroy

    assert_difference 'Item.count' do
      post admin_category_items_url(@category), params: {
        item: @item.attributes.merge(
          icon: fixture_file_upload('public/blank.jpg')
        )
      }
    end
  end

  test 'should update item' do
    new_name = 'Another name'
    patch admin_item_path(@item), params: { item: { name: new_name } }
    assert_redirected_to admin_category_items_path(@item.category)
    assert_equal new_name, @item.reload.name
  end

  test 'should destroy item' do
    assert_difference 'Item.count', -1 do
      delete admin_item_url(@item)
    end

    assert_redirected_to admin_category_items_path(@item.category)
  end
end
