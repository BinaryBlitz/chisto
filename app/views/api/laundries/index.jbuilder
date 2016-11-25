json.array! @laundries do |laundry|
  json.partial! 'laundry', laundry: laundry

  json.extract! laundry,
                :collection_date, :delivery_date, :delivery_date_opens_at, :delivery_date_closes_at

  json.laundry_treatments laundry.laundry_treatments do |laundry_treatment|
    json.partial! 'api/laundry_treatments/laundry_treatment', laundry_treatment: laundry_treatment

    json.treatment do
      json.partial! 'api/treatments/treatment', treatment: laundry_treatment.treatment
    end
  end
end
