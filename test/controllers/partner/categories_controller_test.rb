require 'test_helper'

class Partner::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'partner.domain.com'
    sign_in_laundry
  end

  test 'should get index' do
    get partner_categories_path
    assert_response :success
  end
end
