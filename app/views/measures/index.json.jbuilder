json.array!(@measures) do |measure|
  json.extract! measure, :id, :name, :unit_id
  json.url measure_url(measure, format: :json)
end
