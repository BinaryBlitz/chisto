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
#

class Promotion < ApplicationRecord
  belongs_to :laundry, optional: true

  has_many :promo_codes, dependent: :destroy

  validates :name, presence: true
end
