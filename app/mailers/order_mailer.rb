class OrderMailer < ApplicationMailer
  ORDERS_MAILBOX = 'orders@chis.to'

  def partner_order_email(order)
    @order = order
    @laundry = @order.laundry
    @user = @order.user
    mail(to: @laundry.email, subject: "Заказ №#{@order.id}")
  end

  def admin_order_email(order)
    @order = order
    mail(to: ORDERS_MAILBOX, subject: "Заказ №#{@order.id}")
  end
end
