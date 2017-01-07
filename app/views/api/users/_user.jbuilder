json.cache! user do
  json.extract! user,
                :id, :first_name, :last_name, :email, :phone_number, :birthdate,
                :city_id, :street_name, :house_number, :apartment_number, :notes, :orders_count
end
