require 'faker'

Client.delete_all
100.times do |i|
  fname = Faker::Name.first_name
  lname =  Faker::Name.last_name
  fullname = [fname,lname].join " "
  Client.create(
    first_name: fname,
    last_name: lname,
    gender: %[a h e u i o y].include?(fname.chars.last) ? 'Female' : 'Male',
    birth_date: Faker::Time.between(77.years.ago, 7.years.ago),
    email: Faker::Internet.safe_email(fullname),
    registered_on: Faker::Time.between(2.years.ago, 1.week.ago)
  )

end
