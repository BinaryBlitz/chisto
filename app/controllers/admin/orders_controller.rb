class Admin::OrdersController < Admin::AdminController
  before_action :set_order, only: [:show, :edit, :update]

  def index
    @orders = Order.order(updated_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to [:admin, @order], notice: 'Заказ успешно изменён'
    else
      render :edit
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:collection_date, :delivery_date, :status)
  end
end
