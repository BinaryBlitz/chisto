class Partner::OrdersController < Partner::PartnerController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.order(updated_at: :desc)
  end

  def show
  end

  private

  # TODO: eager loading
  def set_order
    # @order = Order.includes(line_items: { laundry_treatment: :treatment }).find(params[:id])
    @order = Order.find(params[:id])
  end
end
