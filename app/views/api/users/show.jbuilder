json.partial! 'user', user: @user

if @order
  json.order do
    json.partial! 'api/orders/order', order: @order

    json.laundry do
      json.partial! 'api/laundries/laundry', laundry: @order.laundry
    end

    if @rating
      json.rating do
        json.partial! 'api/ratings/rating', rating: @rating
      end
    else
      json.rating nil
    end
  end
end
