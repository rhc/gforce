json.array!(@planned_workouts) do |planned_workout|
  json.extract! planned_workout, :id, :workout_id, :training_session_id
  json.url planned_workout_url(planned_workout, format: :json)
end
