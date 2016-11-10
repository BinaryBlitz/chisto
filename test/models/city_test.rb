# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float            not null
#  longitude  :float            not null
#

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  setup do
    @city = cities(:city)
  end

  test 'invalid without name' do
    @city.name = nil
    assert @city.invalid?
  end
end
