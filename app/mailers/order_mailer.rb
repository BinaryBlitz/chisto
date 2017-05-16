class OrderMailer < ApplicationMailer
  ORDERS_EMAIL = Rails.application.secrets.orders_email

  helper :application

  def partner_order_email(order)
    @order = order
    @laundry = @order.laundry
    @user = @order.user
    mail(to: @laundry.email, subject: "Заказ №#{@order.id}")
  end

  def admin_order_email(order)
    @order = order
    mail(to: ORDERS_EMAIL, subject: "Заказ №#{@order.id}")
  end
end
