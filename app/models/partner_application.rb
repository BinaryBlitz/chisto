# == Schema Information
#
# Table name: partner_applications
#
#  id                  :integer          not null, primary key
#  representative_name :string           not null
#  laundry_name        :string           not null
#  city                :string
#  phone_number        :string
#  email               :string
#  content             :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class PartnerApplication < ApplicationRecord
  include Phonable

  validates :representative_name, presence: true
  validates :laundry_name, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true
  validates :email, email: true
end
