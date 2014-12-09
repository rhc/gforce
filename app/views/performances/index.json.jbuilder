json.array!(@performances) do |performance|
  json.extract! performance, :id, :attendance_id, :planned_workout_id, :score
  json.url performance_url(performance, format: :json)
end
