json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :training_session_id, :client_id
  json.url attendance_url(attendance, format: :json)
end
