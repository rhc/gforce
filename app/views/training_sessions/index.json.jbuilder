json.array!(@training_sessions) do |training_session|
  json.extract! training_session, :id, :starts_on, :starts_at, :location, :minutes
  json.url training_session_url(training_session, format: :json)
end
