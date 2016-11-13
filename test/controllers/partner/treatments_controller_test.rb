require 'test_helper'

class Partner::TreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'partner.domain.com'
    sign_in_laundry
    @treatment = treatments(:treatment)
  end

  test 'should get index' do
    get partner_treatments_path
    assert_response :success
  end
end
