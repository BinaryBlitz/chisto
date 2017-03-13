json.array! @laundries do |laundry|
  # TODO: move to partial and use multi-fetch caching
  json.cache! [laundry, 'full_laundry'] do
    json.partial! 'api/laundries/laundry', laundry: laundry

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

  json.cache! [laundry, 'schedule'] + (@long_treatment ? ['long'] : []), expires_in: 30.minutes do
    json.extract! laundry, :collection_from, :collection_to
    json.delivery_from laundry.delivery_from(@long_treatment)
    json.delivery_to laundry.delivery_to(@long_treatment)
  end
end
