json.extract! @payment_token, :id, :paid, :created_at

json.order do
  json.partial! 'api/orders/order', order: @payment_token.order
end
