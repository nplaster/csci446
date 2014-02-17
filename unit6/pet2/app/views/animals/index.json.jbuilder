json.array!(@animals) do |animal|
  json.extract! animal, :id, :name, :description, :image_url, :age, :status_id
  json.url animal_url(animal, format: :json)
end
