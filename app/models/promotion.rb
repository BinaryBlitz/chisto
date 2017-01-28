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

class Promotion < ApplicationRecord
  ALPHABET = ('0'..'9').to_a + ('A'..'Z').to_a
  CODE_LENGTH = 8

  attr_accessor :discount

  belongs_to :laundry, optional: true

  has_many :promo_codes, dependent: :destroy

  validates :name, presence: true
  validates :promo_codes_count, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validate :dates_are_valid

  after_create :generate_promo_codes

  private

  def generate_promo_codes
    promo_codes.create((0..promo_codes_count).map { random_promo_code })
  end

  def random_promo_code
    {
      code: random_code,
      discount: discount,
      valid_from: valid_from,
      valid_until: valid_until,
      laundry: laundry
    }
  end

  def random_code
    Array.new(CODE_LENGTH) { ALPHABET.sample }.join
  end

  def dates_are_valid
    return unless valid_from && valid_until

    errors.add(:valid_until, 'is invalid') if valid_from >= valid_until
  end
end
