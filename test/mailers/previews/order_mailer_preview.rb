# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def partner_order_email
    OrderMailer.partner_order_email(Order.first)
  end

  def admin_order_email
    OrderMailer.admin_order_email(Order.first)
  end
end
