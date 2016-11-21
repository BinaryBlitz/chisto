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
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :inet
#  last_sign_in_ip         :inet
#  confirmation_token      :string
#  confirmed_at            :datetime
#  confirmation_sent_at    :datetime
#  unconfirmed_email       :string
#  rating                  :float            default(0.0)
#  ratings_count           :integer          default(0)
#

class Laundry < ApplicationRecord
  belongs_to :city

  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy
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

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :background_image, ImageUploader
  mount_uploader :logo, LogoUploader
end
