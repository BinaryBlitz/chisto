json.partial! 'user', user: @user

if @order
  json.order do
    json.partial! 'api/orders/order', order: @order

    json.laundry do
      json.partial! 'api/laundries/laundry', laundry: @order.laundry
    end
  end
end
