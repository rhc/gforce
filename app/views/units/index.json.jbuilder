json.array!(@units) do |unit|
  json.extract! unit, :id, :acronym, :description
  json.url unit_url(unit, format: :json)
end
