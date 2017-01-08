class API::SubscriptionsController < API::APIController
  skip_before_action :restrict_access!

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      render :show, status: :created
    else
      render json: @subscription.errors, status: 422
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:phone_number, :content)
  end
end
