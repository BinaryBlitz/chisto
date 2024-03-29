# == Schema Information
#
# Table name: promo_codes
#
#  id              :integer          not null, primary key
#  code            :string           not null
#  promotion_id    :integer
#  laundry_id      :integer
#  discount        :integer          not null
#  reusable        :boolean          default(FALSE)
#  redeemed        :boolean          default(FALSE)
#  valid_from      :datetime
#  valid_until     :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_time_only :boolean          default(FALSE)
#

class PromoCode < ApplicationRecord
  belongs_to :promotion, optional: true
  belongs_to :laundry, optional: true

  has_one :order, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :discount, numericality: { greater_than: 0, less_than: 100 }
  validate :dates_are_valid

  before_save -> { code.upcase! }

  scope :general, -> { where(promotion: nil) }
  scope :unredeemed, -> { where(redeemed: false) }
  scope :indefinite, -> { where(valid_from: nil, valid_until: nil) }
  scope :active, -> { where('valid_from < :now AND valid_until > :now', now: Time.zone.now) }

  def redeem!
    return false if reusable?

    update_attribute(:redeemed, true)
  end

  def expired?
    return false unless valid_until

    Time.zone.now >= valid_until
  end

  private

  def dates_are_valid
    return unless valid_from && valid_until

    errors.add(:valid_until, 'is invalid') if valid_from >= valid_until
  end
end
