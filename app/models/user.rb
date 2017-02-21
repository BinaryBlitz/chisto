# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string           not null
#  last_name        :string           not null
#  phone_number     :string           not null
#  email            :string
#  birthdate        :date
#  api_token        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  city_id          :integer
#  street_name      :string
#  house_number     :string
#  apartment_number :string
#  notes            :text
#  contact_number   :string
#  orders_count     :integer          default(0)
#  device_token     :string
#  platform         :integer          default("ios")
#

# TODO: Validate contact number
class User < ApplicationRecord
  include Phonable

  belongs_to :city

  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, email: true, uniqueness: { case_sensitive: false }
  validates :phone_number, uniqueness: true, presence: true

  has_secure_token :api_token

  enum platform: %i(ios android)

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_counter_cache
    update_attribute(:orders_count, orders.visible.count)
  end
end
