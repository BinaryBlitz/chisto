require 'test_helper'

class API::VerificationTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verification_token = verification_tokens(:verification_token)
  end

  test 'should create user' do
    @verification_token.destroy

    assert_difference 'VerificationToken.count' do
      post api_verification_tokens_url, params: {
        phone_number: @verification_token.phone_number
      }
    end

    assert_response :created
  end

  test 'should update user' do
    demo_code = Rails.application.secrets.demo_code
    patch api_verification_token_path(@verification_token.token), params: {
      code: demo_code
    }
    assert_response :ok
  end
end
