require 'test_helper'

class API::PromoCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promo_code = promo_codes(:promo_code)
  end

  test 'should get show' do
    get api_promo_code_path(@promo_code.code)
    assert_response :success
  end
end
