class Partner::OrdersController < Partner::PartnerController
  def index
    @orders = Order.all
  end
end
