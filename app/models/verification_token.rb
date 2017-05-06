# == Schema Information
#
# Table name: verification_tokens
#
#  id           :integer          not null, primary key
#  token        :string           not null
#  phone_number :string           not null
#  code         :string           not null
#  verified     :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class VerificationToken < ApplicationRecord
  ALPHABET = ('0'..'9').to_a
  CODE_LENGTH = 5

  attr_accessor :entered_code

  before_create :generate_code
  after_create_commit :enqueue_verification_token_dispatch

  validates :phone_number, phone: true

  has_secure_token

  scope :verified, -> { where(verified: true) }
  scope :recent, -> { where('created_at > ?', 15.minutes.ago) }

  def verify(code)
    return false unless created_at > 15.minutes.ago || demo?(code)
    return false unless self.code == code || demo?(code)

    update(verified: true)
  end

  def user
    User.find_by(phone_number: phone_number)
  end

  def as_json(_)
    { phone_number: phone_number, token: token }
  end

  private

  def enqueue_verification_token_dispatch
    VerificationTokenJob.perform_later(self)
  end

  def generate_code
    self.code = Array.new(CODE_LENGTH) { ALPHABET.sample }.join
  end

  def demo?(code)
    return false if code.blank?

    phone_number == Rails.application.secrets.demo_phone_number &&
      code == Rails.application.secrets.demo_code
  end
end
