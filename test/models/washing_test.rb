require 'test_helper'

class WashingTest < ActiveSupport::TestCase
  setup do
    @washing = washings(:washing)
  end

  test 'valid' do
    assert @washing.valid?
  end

  test 'category from list' do
    valid_categories = %w(econom premium)
    valid_categories.each do |category|
      @washing.category = category
      assert @washing.valid?
    end

    @washing.category = 'a'
    assert @washing.invalid?
  end

  test 'valid without image' do
    @washing.remove_image!
    assert @washing.valid?
  end

  test 'valid without logo' do
    @washing.remove_logo!
    assert @washing.valid?
  end

  test 'invalid without image and logo' do
    @washing.remove_image!
    @washing.remove_logo!
    assert @washing.invalid?
  end
end
