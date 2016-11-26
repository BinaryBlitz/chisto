json.extract! rating, :id, :value, :content, :created_at

json.user do
  json.extract! rating.user, :id, :first_name, :last_name
end
