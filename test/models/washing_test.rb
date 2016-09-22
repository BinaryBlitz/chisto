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
end
