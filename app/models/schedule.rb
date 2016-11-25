# == Schema Information
#
# Table name: schedules
#
#  id              :integer          not null, primary key
#  laundry_id      :integer
#  day_of_the_week :integer          not null
#  opens_at        :time             not null
#  closes_at       :time             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Schedule < ApplicationRecord
  belongs_to :laundry

  enum day_of_the_week: %i(mon tue wed thu fri sat sun)

  validates :day_of_the_week, uniqueness: { scope: :laundry_id }, presence: true
  validates :opens_at, presence: true
  validates :closes_at, presence: true
  validate :closes_after_opening

  private

  def closes_after_opening
    return unless opens_at.present? && closes_at.present?

    errors.add(:closes_at, 'is invalid') if closes_at < opens_at
  end
end
