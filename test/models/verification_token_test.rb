require 'test_helper'

class VerificationTokenTest < ActiveSupport::TestCase
  setup do
    @verification_token = verification_tokens(:verification_token)
  end

  test 'invalid without phone number' do
    @verification_token.phone_number = nil
    assert @verification_token.invalid?
  end

  test 'generates code and token before creation' do
    token = VerificationToken.new(phone_number: @verification_token.phone_number)
    token.save
    assert_not_nil token.code
    assert_not_nil token.token
  end

  test 'demo token' do
    @verification_token.phone_number = Rails.application.secrets.demo_phone_number
    assert @verification_token.verify(Rails.application.secrets.demo_code)
  end
end
