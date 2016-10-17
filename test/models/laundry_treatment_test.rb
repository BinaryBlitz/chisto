# == Schema Information
#
# Table name: laundry_treatments
#
#  id           :integer          not null, primary key
#  laundry_id   :integer
#  treatment_id :integer
#  price        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class LaundryTreatmentTest < ActiveSupport::TestCase
  setup do
    @laundry_treatment = laundry_treatments(:laundry_treatment)
  end

  test 'price is positive' do
    @laundry_treatment.price = 0
    assert @laundry_treatment.invalid?
  end
end
