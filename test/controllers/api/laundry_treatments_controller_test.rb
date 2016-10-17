require 'test_helper'

class API::LaundryTreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laundry_treatment = laundry_treatments(:laundry_treatment)
  end
end
