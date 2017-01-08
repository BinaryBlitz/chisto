json.cache! order_item do
  json.extract! order_item,
                :id, :item_id, :laundry_item_id, :quantity, :has_decoration, :multiplier
end
