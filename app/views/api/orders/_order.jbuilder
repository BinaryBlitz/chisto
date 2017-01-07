json.cache! order do
  json.extract! order,
                :id, :laundry_id, :status, :paid, :total_price, :delivery_fee,
                :street_name, :house_number, :apartment_number, :contact_number, :notes,
                :created_at, :updated_at
end
