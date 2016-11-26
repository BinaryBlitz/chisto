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

  after_commit -> { laundry.update_rating_cache }, on: [:create, :update]
  after_save -> { laundry.update_counter_cache }
  after_destroy -> { laundry.update_counter_cache }

  scope :verified, -> { where(verified: true) }
end
