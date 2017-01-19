json.cache! @items do
  json.array! @items, partial: 'api/items/item', as: :item
end
