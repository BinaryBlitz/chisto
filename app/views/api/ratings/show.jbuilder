json.partial! 'rating', rating: @rating

json.user do
  json.extract! @rating.user, :id, :first_name, :last_name
end
