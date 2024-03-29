require 'test_helper'

class Partner::LaundryTreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'partner.domain.com'
    sign_in_laundry
    @laundry_treatment = laundry_treatments(:laundry_treatment)
    @laundry_item = laundry_items(:laundry_item)
    @treatment = @laundry_treatment.treatment
    @category = @treatment.item.category
  end

  test 'should get index' do
    get partner_category_treatments_path(@category)
    assert_response :success
  end

  test 'should create treatment' do
    @laundry_treatment.destroy

    assert_difference 'LaundryTreatment.count' do
      post partner_treatment_laundry_treatment_url(@treatment), params: {
        laundry_treatment: @laundry_treatment.attributes
      }
    end
    assert_redirected_to partner_category_treatments_path(@category)
  end

  test 'should update treatment' do
    new_price = rand(10) + 1
    patch partner_treatment_laundry_treatment_path(@treatment), params: {
      laundry_treatment: { price: new_price }
    }
    assert_redirected_to partner_category_treatments_path(@category)
    assert_equal new_price, @laundry_treatment.reload.price
  end

  test 'should destroy treatment' do
    assert_difference 'LaundryTreatment.count', -1 do
      delete partner_treatment_laundry_treatment_url(@treatment)
    end

    assert_redirected_to partner_category_treatments_path(@category)
  end
end
