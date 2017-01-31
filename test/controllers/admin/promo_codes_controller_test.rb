require 'test_helper'

class Admin::PromoCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'admin.domain.com'
    sign_in_admin
    @promo_code = promo_codes(:promo_code)
  end

  test 'should get index' do
    get admin_promo_codes_path
    assert_response :success
  end

  test 'should create promo_code' do
    @promo_code.destroy

    assert_difference 'PromoCode.count' do
      post admin_promo_codes_url(@promo_code), params: { promo_code: @promo_code.attributes }
    end
  end
end
