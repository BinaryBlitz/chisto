json.partial! 'order', order: @order

json.order_items @order.order_items do |order_item|
  json.partial! 'api/order_items/order_item', order_item: order_item

  json.order_treatments order_item.order_treatments do |order_treatment|
    json.partial! 'api/order_treatments/order_treatment', order_treatment: order_treatment

    json.laundry_treatment do
      json.partial! 'api/laundry_treatments/laundry_treatment',
                    laundry_treatment: order_treatment.laundry_treatment

      json.treatment do
        json.partial! 'api/treatments/treatment',
                      treatment: order_treatment.laundry_treatment.treatment
      end
    end
  end
end

if @order.payment
  json.payment do
    json.partial! 'api/payments/payment', payment: @order.payment
  end
end

if @order.promo_code
  json.promo_code do
    json.partial! 'api/promo_codes/promo_code', promo_code: @order.promo_code
  end
end
