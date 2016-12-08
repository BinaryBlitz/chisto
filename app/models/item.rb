# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string           not null
#  icon        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  use_area    :boolean          default(FALSE)
#

class Item < ApplicationRecord
  belongs_to :category

  has_many :treatments, -> { order(name: :asc) }, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  validates :description, presence: true

  mount_uploader :icon, IconUploader
end
