json.cache! category do
  json.extract! category,
                :id, :name, :description, :icon_url, :color, :featured,
                :items_count, :items_preview
end
