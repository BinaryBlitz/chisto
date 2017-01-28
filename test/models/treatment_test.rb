# == Schema Information
#
# Table name: treatments
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#

require 'test_helper'

class TreatmentTest < ActiveSupport::TestCase
  setup do
    @treatment = treatments(:treatment)
  end

  test 'invalid without name' do
    @treatment.name = nil
    assert @treatment.invalid?
  end
end
