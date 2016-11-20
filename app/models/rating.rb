# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  laundry_id :integer
#  value      :integer          not null
#  content    :text
#  verified   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord
  after_commit :update_rating_cache, on: [:create, :update]

  belongs_to :user
  belongs_to :laundry

  validates :value, inclusion: { in: 1..5 }
  validates :laundry, uniqueness: { scope: :user }

  scope :verified, -> { where(verified: true) }

  def update_rating_cache
    return unless laundry.present?

    laundry.update(rating: laundry.ratings.average(:value) || 0)
  end
end
