class API::VerificationTokensController < API::APIController
  skip_before_action :restrict_access!

  def create
    @verification_token = VerificationToken.new(verification_token_params)

    if @verification_token.save
      render json: @verification_token, status: :created
    else
      render json: @verification_token.errors, status: 422
    end
  end

  def update
    @verification_token = VerificationToken.find_by!(token: update_verification_token_params[:token])

    if @verification_token.verify(update_verification_token_params[:code])
      render json: { api_token: @verification_token.user.try(:api_token) }
    else
      head :forbidden
    end
  end

  private

  def verification_token_params
    params.require(:verification_token).permit(:phone_number)
  end

  def update_verification_token_params
    params.require(:verification_token).permit(:token, :code)
  end
end
