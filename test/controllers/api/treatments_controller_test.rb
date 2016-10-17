require 'test_helper'

class API::TreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatment = treatments(:treatment)
    @item = @treatment.item
  end

  test 'should get index' do
    get api_item_treatments_path(@item, api_token: api_token)
    assert_response :success
  end
end
