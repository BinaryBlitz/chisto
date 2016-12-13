require 'test_helper'

class API::VerificationTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verification_token = verification_tokens(:verification_token)
  end

  test 'should create user' do
    @verification_token.destroy

    assert_difference 'VerificationToken.count' do
      post api_verification_token_url, params: {
        verification_token: @verification_token.attributes
      }
    end

    assert_response :created
  end

  test 'should update user' do
    demo_code = Rails.application.secrets.demo_code
    patch api_verification_token_path, params: {
      token: @verification_token.token,
      code: demo_code
    }
    assert_response :ok
  end
end
