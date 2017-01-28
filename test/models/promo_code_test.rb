# == Schema Information
#
# Table name: promo_codes
#
#  id           :integer          not null, primary key
#  code         :string           not null
#  promotion_id :integer
#  laundry_id   :integer
#  discount     :integer          not null
#  reusable     :boolean          default(FALSE)
#  redeemed     :boolean          default(FALSE)
#  valid_from   :datetime
#  valid_until  :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PromoCodeTest < ActiveSupport::TestCase
  setup do
    @promo_code = promo_codes(:promo_code)
    @reusable_promo_code = promo_codes(:reusable_promo_code)
  end

  test 'valid' do
    assert @promo_code.valid?
  end

  test 'discount is in valid range' do
    @promo_code.discount = 0
    assert @promo_code.invalid?

    @promo_code.discount = 100
    assert @promo_code.invalid?
  end

  test 'valid_until is later than valid_from' do
    @promo_code.valid_until = @promo_code.valid_from - 1.day
    assert @promo_code.invalid?
  end

  test 'cannot be redeemed if reusable' do
    refute @reusable_promo_code.redeem!
  end

  test 'expired?' do
    @promo_code.valid_until = 1.day.from_now
    refute @promo_code.expired?

    @promo_code.valid_until = 1.day.ago
    assert @promo_code.expired?

    # Without expiry date
    @promo_code.valid_from = nil
    @promo_code.valid_until = nil
    refute @promo_code.expired?
  end
end
