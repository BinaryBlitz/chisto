# == Schema Information
#
# Table name: laundries
#
#  id                      :integer          not null, primary key
#  name                    :string           not null
#  description             :string           not null
#  logo                    :string
#  background_image        :string
#  category                :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  city_id                 :integer
#  minimum_order_price     :integer
#  minimum_collection_time :integer
#  order_processing_time   :integer
#

class Laundry < ApplicationRecord
  belongs_to :city

  has_many :laundry_treatments, dependent: :destroy
  has_many :treatments, through: :laundry_treatments

  validates :category, inclusion: { in: %w(economy premium) }
  validates :name, :description, presence: true
  validates :city, presence: true

  validates :minimum_order_price,
            :minimum_collection_time,
            :order_processing_time,
            numericality: { greater_than: 0 }, allow_nil: true

  validates :background_image, presence: true
  validates :logo, presence: true

  mount_uploader :background_image, ImageUploader
  mount_uploader :logo, LogoUploader
end
