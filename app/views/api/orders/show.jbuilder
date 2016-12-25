json.partial! 'order', order: @order

json.line_items @order.line_items do |line_item|
  json.partial! 'api/line_items/line_item', line_item: line_item

  json.laundry_treatment do
    json.partial! 'api/laundry_treatments/laundry_treatment',
                  laundry_treatment: line_item.laundry_treatment

    json.treatment do
      json.partial! 'api/treatments/treatment', treatment: line_item.laundry_treatment.treatment

      json.item do
        json.partial! 'api/items/item', item: line_item.laundry_treatment.treatment.item
      end
    end
  end
end

json.laundry do
  json.partial! 'api/laundries/laundry', laundry: @order.laundry
end
