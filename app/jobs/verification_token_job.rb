class VerificationTokenJob < ApplicationJob
  queue_as :default

  def perform(verification_token)
    phone_number = verification_token.phone_number
    content = "Код верификации: #{verification_token.code}"

    SMSNotifier.new(phone_number, content).notify
  end
end
