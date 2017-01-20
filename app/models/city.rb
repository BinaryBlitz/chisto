# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float            not null
#  longitude  :float            not null
#  deleted_at :datetime
#

class City < ApplicationRecord
  include SoftDeletable

  has_many :users
  has_many :laundries

  validates :name, presence: true
  validates :latitude, inclusion: { in: -90..90 }
  validates :longitude, inclusion: { in: -180..180 }

  def to_location
    [latitude, longitude]
  end
end
