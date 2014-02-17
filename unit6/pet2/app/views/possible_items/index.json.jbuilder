json.array!(@possible_items) do |possible_item|
  json.extract! possible_item, :id, :animal_id, :consider_id
  json.url possible_item_url(possible_item, format: :json)
end
