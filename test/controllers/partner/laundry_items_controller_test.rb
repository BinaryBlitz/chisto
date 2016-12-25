require 'test_helper'

class Partner::LaundryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'partner.domain.com'
    sign_in_laundry
    @laundry_item = laundry_items(:laundry_item)
    @item = @laundry_item.item
    @category = @item.category
  end

  test 'should create laundry item' do
    @laundry_item.destroy

    assert_difference 'LaundryItem.count' do
      post partner_item_laundry_item_url(@item), params: {
        laundry_item: @laundry_item.attributes
      }
    end
    assert_redirected_to partner_category_treatments_path(@category)
  end

  test 'should update laundry treatment' do
    new_multiplier = rand(10) + 1
    patch partner_item_laundry_item_path(@item), params: {
      laundry_item: { decoration_multiplier: new_multiplier }
    }
    assert_redirected_to partner_category_treatments_path(@category)
    assert_equal new_multiplier, @laundry_item.reload.decoration_multiplier
  end

  test 'should destroy laundry treatment' do
    assert_difference 'LaundryItem.count', -1 do
      delete partner_item_laundry_item_url(@item)
    end

    assert_redirected_to partner_category_treatments_path(@category)
  end
end
