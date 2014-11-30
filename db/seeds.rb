require 'faker'



# Create training sessions

Payment.delete_all
Attendance.delete_all
TrainingSession.delete_all
training_date = 1.years.ago.beginning_of_week + 16.hours
while training_date < (Date.today + 3.weeks) do
  4.times do |i|
    ts = TrainingSession.create(starts_at: training_date + i.days, minutes: 60, location: 'Stadium'  )
    puts ts.to_s
  end
  training_date += 7.days
end


Client.delete_all
30.times do |i|
  puts "Client #{i} out of 30"
  fname = Faker::Name.first_name
  lname =  Faker::Name.last_name
  fullname = [fname,lname].join " "
  registration_date = Faker::Time.between(1.years.ago, 1.week.ago)
  client = Client.create(
    first_name: fname,
    last_name: lname,
    gender: %[a h e u i  y].include?(fname.chars.last) ? 'Female' : 'Male',
    birth_date: Faker::Time.between(77.years.ago, 7.years.ago),
    email: Faker::Internet.safe_email(fullname),
    registered_on: registration_date
  )
  payment_date = registration_date
  interval = 0
  while (payment_date += interval.days) < Date.today
    client.payments.create(amount: 150, paid_on: payment_date ) 
    interval = (15..60).to_a.shuffle.first
  end

  TrainingSession.where("starts_at > ? and starts_at < ?", [registration_date, Date.today]).each do |training_session|
    training_session.attendances.create(client: client) if (1..10).to_a.shuffle.first < 10 # 90% of attendance
  end


end



