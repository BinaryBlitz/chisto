require 'test_helper'

class Admin::TreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'admin.domain.com'
    sign_in_admin
    @treatment = treatments(:treatment)
    @item = @treatment.item
  end

  test 'should get index' do
    get admin_item_treatments_path(@item)
    assert_response :success
  end

  test 'should create treatment' do
    assert_difference 'Treatment.count' do
      post admin_item_treatments_url(@item), params: { treatment: @treatment.attributes }
    end
  end

  test 'should update treatment' do
    new_name = 'Another name'
    patch admin_treatment_path(@treatment), params: { treatment: { name: new_name } }
    assert_redirected_to admin_item_treatments_path(@treatment.item)
    assert_equal new_name, @treatment.reload.name
  end

  test 'should destroy treatment' do
    assert_difference 'Treatment.count', -1 do
      delete admin_treatment_url(@treatment)
    end

    assert_redirected_to admin_item_treatments_path(@treatment.item)
  end
end
