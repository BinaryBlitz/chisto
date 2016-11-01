class API::OrdersController < API::APIController
  before_action :set_laundry, only: [:create]

  def index
    @orders = current_user.orders
  end

  def create
    @order = @laundry.orders.build(laundry_params.merge(user: current_user))

    if @order.save
      render status: :created
    else
      render json: @order.errors, status: 422
    end
  end

  private

  def set_laundry
    @laundry = Laundry.find(params[:laundry_id])
  end

  def laundry_params
    params
      .require(:order)
      .permit(:street_name, :house_number, :apartment_number, :contact_number, :notes)
  end
end
