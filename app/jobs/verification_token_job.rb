class VerificationTokenJob < ApplicationJob
  queue_as :default

  def perform(verification_token)
    verification_token.send_verification_code
  end
end
