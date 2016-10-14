# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  first_name   :string           not null
#  last_name    :string           not null
#  phone_number :string           not null
#  email        :string
#  address      :string           not null
#  birthdate    :date
#  api_token    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
  include Phonable

  validates :first_name, :last_name, :address, presence: true
  validates :email, email: true, uniqueness: { case_sensitive: false }
  validates :phone_number, uniqueness: true

  has_secure_token :api_token

  def full_name
    "#{first_name} #{last_name}"
  end
end
