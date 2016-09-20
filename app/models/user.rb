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
