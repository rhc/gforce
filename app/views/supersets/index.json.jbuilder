json.array!(@supersets) do |superset|
  json.extract! superset, :id, :workout_id, :exercise_id, :unit_id, :amount, :sequence
  json.url superset_url(superset, format: :json)
end
