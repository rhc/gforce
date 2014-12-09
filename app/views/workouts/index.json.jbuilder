json.array!(@workouts) do |workout|
  json.extract! workout, :id, :name, :unit_id, :description
  json.url workout_url(workout, format: :json)
end
