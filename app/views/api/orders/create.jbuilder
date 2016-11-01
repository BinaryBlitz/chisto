json.partial! 'order', order: @order

json.payment do
  json.partial! 'api/payments/payment', payment: @order.payment
end
