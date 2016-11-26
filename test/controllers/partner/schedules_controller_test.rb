require 'test_helper'

class Partner::SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'partner.domain.com'
    sign_in_laundry
    @schedule = schedules(:schedule)
  end

  test 'should get index' do
    get partner_schedule_path
  end
end
