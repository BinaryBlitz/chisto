# == Schema Information
#
# Table name: promotions
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  description       :string
#  laundry_id        :integer
#  promo_codes_count :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  valid_from        :datetime
#  valid_until       :datetime
#

require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  setup do
    @promotion = promotions(:promotion)
    @promotion.discount = 15
  end

  test 'valid' do
    assert @promotion.valid?
  end

  test 'name is present' do
    @promotion.name = nil
    assert @promotion.invalid?
  end
end
