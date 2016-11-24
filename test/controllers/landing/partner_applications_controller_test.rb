require 'test_helper'

class Landing::PartnerApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partner_application = partner_applications(:partner_application)
  end

  test 'should get partner page' do
    get partner_path
    assert_response :success
  end

  test 'should create partner application' do
    assert_difference 'PartnerApplication.count' do
      post landing_partner_applications_path, params: {
        partner_application: @partner_application.attributes
      }
    end
    assert_redirected_to partner_path
  end
end
