# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  laundry_id :integer
#  value      :integer          not null
#  content    :text
#  verified   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  setup do
    @rating = ratings(:rating)
  end

  test 'valid' do
    assert @rating.valid?
  end

  test 'value is between 1 and 5' do
    @rating.value = 0
    assert @rating.invalid?
  end
end
