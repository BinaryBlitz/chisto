json.array! @laundries do |laundry|
  json.partial! 'api/laundries/laundry', laundry: laundry

  json.extract! laundry,
                :collection_date, :delivery_date,
                :delivery_date_opens_at, :delivery_date_closes_at

  json.cache! laundry.laundry_items do
    json.laundry_items laundry.laundry_items do |laundry_item|
      json.partial! 'api/laundry_items/laundry_item',
                    laundry_item: laundry_item
    end
  end

  json.cache! laundry.laundry_treatments do
    json.laundry_treatments laundry.laundry_treatments do |laundry_treatment|
      json.partial! 'api/laundry_treatments/laundry_treatment',
                    laundry_treatment: laundry_treatment
    end
  end
end
