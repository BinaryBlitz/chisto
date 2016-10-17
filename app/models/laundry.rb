# == Schema Information
#
# Table name: laundries
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string           not null
#  logo        :string
#  image       :string
#  category    :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Laundry < ApplicationRecord
  has_many :laundry_treatments, dependent: :destroy
  has_many :treatments, through: :laundry_treatments

  validates :category, inclusion: { in: %w(economy premium) }
  validates :name, :description, presence: true

  # TODO: Rename image to background image, fix validations
  # validates :image, presence: true, unless: :logo?
  # validates :logo, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
  mount_uploader :logo, LogoUploader
end
