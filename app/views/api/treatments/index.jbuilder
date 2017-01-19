json.cache! @treatments do
  json.array! @treatments, partial: 'api/treatments/treatment', as: :treatment
end
