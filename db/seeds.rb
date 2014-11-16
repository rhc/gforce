require 'faker'

Client.delete_all
100.times do |i|
  fname = Faker::Name.first_name
  lname =  Faker::Name.last_name
  fullname = [fname,lname].join " "
  registration_date = Faker::Time.between(2.years.ago, 1.week.ago)
  client = Client.create(
    first_name: fname,
    last_name: lname,
    gender: %[a h e u i o y].include?(fname.chars.last) ? 'Female' : 'Male',
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


end
