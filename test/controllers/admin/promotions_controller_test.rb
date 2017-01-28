require 'test_helper'

class Admin::PromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'admin.domain.com'
    sign_in_admin
    @promotion = promotions(:promotion)
  end

  test 'should get index' do
    get admin_promotions_path
    assert_response :success
  end

  test 'should create promotion' do
    assert_difference 'Promotion.count' do
      post admin_promotions_url(@promotion), params: { promotion: @promotion.attributes }
    end
  end
end
