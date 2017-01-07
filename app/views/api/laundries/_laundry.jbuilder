json.cache! laundry do
  json.extract! laundry,
                :id, :name, :description,
                :background_image_url, :logo_url, :rating, :ratings_count,
                :delivery_fee, :free_delivery_from, :minimum_order_price
end
