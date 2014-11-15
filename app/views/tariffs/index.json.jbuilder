json.array!(@tariffs) do |tariff|
  json.extract! tariff, :id, :starts_on, :expires_on, :amount
  json.url tariff_url(tariff, format: :json)
end
