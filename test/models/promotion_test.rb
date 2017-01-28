require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  setup do
    @promotion = promotions(:promotion)
  end

  test 'valid' do
    assert @promotion.valid?
  end

  test 'name is present' do
    @promotion.name = nil
    assert @promotion.invalid?
  end
end
