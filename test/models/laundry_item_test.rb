# == Schema Information
#
# Table name: laundry_items
#
#  id                    :integer          not null, primary key
#  laundry_id            :integer
#  item_id               :integer
#  decoration_multiplier :float            default(1.0)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class LaundryItemTest < ActiveSupport::TestCase
  setup do
    @laundry_item = laundry_items(:laundry_item)
  end

  test 'valid' do
    assert @laundry_item.valid?
  end

  test 'decoration multiplier is greater than or equal to 1' do
    @laundry_item.decoration_multiplier = 0.9
    assert @laundry_item.invalid?
  end
end
