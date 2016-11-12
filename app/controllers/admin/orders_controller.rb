class Admin::OrdersController < Admin::AdminController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def show
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
