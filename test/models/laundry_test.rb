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

  test 'valid without image' do
    @laundry.remove_image!
    assert @laundry.valid?
  end

  test 'valid without logo' do
    @laundry.remove_logo!
    assert @laundry.valid?
  end

  test 'invalid without image and logo' do
    @laundry.remove_image!
    @laundry.remove_logo!
    assert @laundry.invalid?
  end
end
