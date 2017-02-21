class OrderMailer < ApplicationMailer
  def new_order_email(order)
    @order = order
    @laundry = @order.laundry
    @user = @order.user
    mail(to: @laundry.email, subject: "Заказ №#{@order.id}")
  end
end
