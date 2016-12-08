class Partner::OrdersController < Partner::PartnerController
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
      redirect_to [:partner, @order], notice: 'Заказ успешно изменён'
    else
      render :edit
    end
  end

  private

  # TODO: eager loading
  def set_order
    # @order = Order.includes(line_items: { laundry_treatment: :treatment }).find(params[:id])
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
