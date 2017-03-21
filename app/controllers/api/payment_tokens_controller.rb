class API::PaymentTokensController < API::APIController
  before_action :set_order, only: [:create]

  def create
    @payment_token = @order.build_payment_token(payment_token_params)

    if @payment_token.save
      render :show, status: :created
    else
      render json: @payment_token.errors, status: 422
    end
  end

  private

  def set_order
    @order = current_user.orders.find(params[:order_id])
  end

  def payment_token_params
    params.require(:payment_token).permit(:encoded_payment_data)
  end
end
