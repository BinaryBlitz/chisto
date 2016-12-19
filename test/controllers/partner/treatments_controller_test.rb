require 'test_helper'

class Partner::TreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'partner.domain.com'
    sign_in_laundry
    @treatment = treatments(:treatment)
    @category = @treatment.item.category
  end

  test 'should get index' do
    get partner_category_treatments_path(@category)
    assert_response :success
  end
end
