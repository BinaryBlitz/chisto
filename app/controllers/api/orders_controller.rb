class API::OrdersController < API::APIController
  before_action :set_laundry, only: [:create]
  before_action :set_order, only: []

  def index
    @orders = current_user.orders.order(updated_at: :desc).visible
  end

  def show
    @order = Order
      .includes(
        :laundry, order_items: { order_treatments: { laundry_treatment: { treatment: :item }}}
      )
      .find(params[:id])
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

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def laundry_params
    params
      .require(:order)
      .permit(
        :street_name, :house_number, :apartment_number,
        :contact_number, :notes, :email, :payment_method,
        order_items_attributes: [
          :item_id, :quantity, :area, :has_decoration,
          order_treatments_attributes: [:laundry_treatment_id]
        ]
      )
  end
end
