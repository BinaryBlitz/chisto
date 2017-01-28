json.partial! 'order', order: @order

json.order_items @order.order_items do |order_item|
  json.partial! 'api/order_items/order_item', order_item: order_item

  json.order_treatments order_item.order_treatments do |order_treatment|
    json.partial! 'api/order_treatments/order_treatment', order_treatment: order_treatment

    json.treatment do
      json.partial! 'api/treatments/treatment', treatment: order_treatment.treatment

      json.item do
        json.partial! 'api/items/item', item: order_treatment.treatment.item
      end
    end
  end
end

json.laundry do
  json.partial! 'api/laundries/laundry', laundry: @order.laundry
end

if @order.promo_code
  json.promo_code do
    json.partial! 'api/promo_codes/promo_code', promo_code: @order.promo_code
  end
end

if @rating
  json.rating do
    json.partial! 'api/ratings/rating', rating: @rating
  end
end
