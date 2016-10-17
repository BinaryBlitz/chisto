# == Schema Information
#
# Table name: laundries
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string           not null
#  logo        :string
#  image       :string
#  category    :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class LaundryTest < ActiveSupport::TestCase
  setup do
    @laundry = laundries(:laundry)
  end

  test 'valid' do
    assert @laundry.valid?
  end

  test 'category from list' do
    valid_categories = %w(economy premium)
    valid_categories.each do |category|
      @laundry.category = category
      assert @laundry.valid?
    end

    @laundry.category = 'a'
    assert @laundry.invalid?
  end

  # FIXME
  test 'invalid without image and logo' do
    skip
    @laundry.remove_image!
    @laundry.remove_logo!
    assert @laundry.invalid?
  end
end
