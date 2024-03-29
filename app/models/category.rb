# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  description   :string
#  icon          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  color         :string           not null
#  featured      :boolean          default(FALSE)
#  items_count   :integer          default(0)
#  items_preview :string           default([]), is an Array
#  deleted_at    :datetime
#

class Category < ApplicationRecord
  COLOR_HEX_FORMAT = /\A#(?:[A-F0-9]{3}){1,2}\z/i
  ITEMS_IN_PREVIEW = 3

  include SoftDeletable

  has_many :items, -> { order(name: :asc) }, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  validates :color, format: { with: COLOR_HEX_FORMAT }

  before_validation -> { color.downcase! if color.present? }

  mount_uploader :icon, IconUploader

  def update_items_preview
    item_names = Item.where(category: self)
      .order(:name)
      .limit(ITEMS_IN_PREVIEW)
      .distinct
      .pluck(:name)
    update_attribute(:items_preview, item_names)
  end
end
