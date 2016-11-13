json.partial! 'order', order: @order

json.payment do
  json.partial! 'api/payments/payment', payment: @order.payment
end

json.line_items @order.line_items do |line_item|
  json.partial! 'api/line_items/line_item', line_item: line_item

  json.laundry_treatment do
    json.partial! 'api/laundry_treatments/laundry_treatment',
                  laundry_treatment: line_item.laundry_treatment

    json.treatment do
      json.partial! 'api/treatments/treatment', treatment: line_item.laundry_treatment.treatment
    end
  end
end
