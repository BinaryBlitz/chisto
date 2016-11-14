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
#

class Category < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  mount_uploader :icon, IconUploader
end
