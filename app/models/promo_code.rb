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

class PromoCode < ApplicationRecord
  belongs_to :promotion, optional: true
  belongs_to :laundry, optional: true

  validates :discount, numericality: { greater_than: 0, less_than: 100 }
  validate :dates_are_valid

  def redeem!
    return false if reusable?

    update_attribute(:redeemed, true)
  end

  private

  def dates_are_valid
    return unless valid_from && valid_until

    errors.add(:valid_until, 'is invalid') if valid_from >= valid_until
  end
end
