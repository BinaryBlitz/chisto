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
  DAYS_OF_THE_WEEK = %i(mon tue wed thu fri sat sun)

  belongs_to :laundry

  enum day_of_the_week: DAYS_OF_THE_WEEK

  validates :day_of_the_week, uniqueness: { scope: :laundry_id }, presence: true
  validates :opens_at, presence: true
  validates :closes_at, presence: true
  validate :closes_after_opening

  def to_hash
    { day_of_the_week.to_sym => { opens_at.strftime('%H:%M') => closes_at.strftime('%H:%M') } }
  end

  private

  def closes_after_opening
    return unless opens_at.present? && closes_at.present?

    errors.add(:closes_at, 'is invalid') if closes_at < opens_at
  end
end
