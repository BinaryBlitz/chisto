# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  name           :string           not null
#  icon           :string
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  use_area       :boolean          default(FALSE)
#  deleted_at     :datetime
#  long_treatment :boolean          default(FALSE)
#

class Item < ApplicationRecord
  include SoftDeletable

  belongs_to :category, counter_cache: true

  has_many :treatments, -> { order(name: :asc) }, dependent: :destroy
  has_many :laundry_items, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  validates :description, presence: true

  after_save -> { category.update_items_preview }
  after_destroy -> { category.update_items_preview }

  mount_uploader :icon, IconUploader

  # Soft deleted association
  def category
    Category.unscoped { super }
  end
end
