# == Schema Information
#
# Table name: schedules
#
#  id              :integer          not null, primary key
#  laundry_id      :integer
#  day_of_the_week :integer          not null
#  opens_at        :time             not null
#  closes_at       :time             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  setup do
    @schedule = schedules(:schedule)
  end

  test 'valid' do
    assert @schedule.valid?
  end

  test 'closes after opening' do
    @schedule.opens_at = '12:00'
    @schedule.closes_at = '11:00'

    assert @schedule.invalid?
  end

  test 'opens_at is different from closes_at' do
    @schedule.closes_at = @schedule.opens_at

    assert @schedule.invalid?
  end
end
