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
  SMS_VERIFICATION_URL = 'http://sms.ru/sms/send'
  ALPHABET = ('0'..'9').to_a

  attr_accessor :entered_code

  before_create :generate_code
  after_create :send_verification_code

  validates :phone_number, phone: true

  has_secure_token

  scope :verified, -> { where(verified: true) }

  def verify(code)
    return false unless self.code == code || demo?(code)
    update(verified: true)
  end

  def user
    User.find_by(phone_number: phone_number)
  end

  def send_verification_code
    return true if phone_number == Rails.application.secrets.demo_phone_number

    response = HTTParty.post(SMS_VERIFICATION_URL, body: sms_verification_params).parsed_response

    if response.lines.first.try(:chomp) == '100'
      true
    else
      logger.info "#{Time.zone.now}: SMS verification for #{phone_number} failed.\n#{response}"
      false
    end
  end

  def as_json(_)
    { phone_number: phone_number, token: token }
  end

  private

  def generate_code
    self.code = 4.times.map { ALPHABET.sample }.join
  end

  def sms_verification_params
    {
      api_id: Rails.application.secrets.sms_ru_api_id,
      text: "Код верификации: #{code}",
      to: phone_number
    }
  end

  def demo?(code)
    return false if code.blank?

    phone_number == Rails.application.secrets.demo_phone_number &&
      code == Rails.application.secrets.demo_code
  end
end
