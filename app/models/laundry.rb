class Laundry < ApplicationRecord
  validates :category, inclusion: { in: %w(economy premium) }
  validates :name, :description, presence: true
  validates :image, presence: true, unless: :logo?
  validates :logo, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
  mount_uploader :logo, LogoUploader
end
