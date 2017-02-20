require 'test_helper'

class VerificationTokenJobTest < ActiveJob::TestCase
  setup do
    @verification_token = verification_tokens(:verification_token)
  end
end
