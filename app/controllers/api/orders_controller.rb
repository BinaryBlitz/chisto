class API::OrdersController < API::APIController
  before_action :set_laundry, only: [:create]
  before_action :set_order, only: [:show]
  before_action :set_rating, only: [:show]

  def index
    @orders = current_user.orders.order(updated_at: :desc).visible
  end

  def show
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

  def set_rating
    @rating = current_user.ratings.find_by(laundry: @order.laundry)
  end

  def laundry_params
    params
      .require(:order)
      .permit(
        :street_name, :house_number, :apartment_number,
        :contact_number, :notes, :email, :payment_method, :promo_code_id,
        order_items_attributes: [
          :item_id, :quantity, :area, :has_decoration,
          order_treatments_attributes: [:laundry_treatment_id]
        ]
      )
  end
end
