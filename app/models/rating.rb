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
  belongs_to :user
  belongs_to :laundry

  validates :value, inclusion: { in: 1..5 }
  validates :laundry, uniqueness: { scope: :user }

  after_commit :update_rating_cache, on: [:create, :update]
  after_save :update_counter_cache
  after_destroy :update_counter_cache

  scope :verified, -> { where(verified: true) }

  private

  def update_rating_cache
    return unless laundry.present?

    laundry.update(rating: laundry.ratings.verified.average(:value) || 0)
  end

  def update_counter_cache
    laundry.update_attribute(:ratings_count, laundry.ratings.verified.count)
  end
end
