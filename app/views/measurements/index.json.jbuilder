json.array!(@measurements) do |measurement|
  json.extract! measurement, :id, :attendance_id, :measure_id, :score
  json.url measurement_url(measurement, format: :json)
end
