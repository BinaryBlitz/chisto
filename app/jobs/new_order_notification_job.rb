class NewOrderNotificationJob < ApplicationJob
  queue_as :default

  def perform(order)
    @order = order

    phone_number = order.laundry.phone_number
    content = "Поступил новый заказ №#{@order.id}. Подробнее: #{order_url}"

    SMSNotifier.new(phone_number, content).notify
  end

  private

  def order_url
    url_options = { host: 'chis.to', protocol: 'https' }
    Rails.application.routes.url_helpers.partner_order_url(@order, url_options)
  end
end
