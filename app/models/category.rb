# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string
#  icon        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  color       :string           not null
#

class Category < ApplicationRecord
  COLOR_HEX_FORMAT = /\A#(?:[A-F0-9]{3}){1,2}\z/i

  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  validates :color, format: { with: COLOR_HEX_FORMAT }

  before_validation -> { color.downcase! if color.present? }

  mount_uploader :icon, IconUploader
end
