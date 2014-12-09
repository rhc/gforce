require 'faker'

def create_tariffs
  Tariff.create( starts_on: 1.year.ago, expires_on: 6.months.ago, amount: 100)
  Tariff.create( starts_on: 6.months.ago, expires_on: Date.today + 1.year, amount: 150)
end

def create_units
  Unit.create( acronym: "Reps", description: "Repetitions")
  Unit.create( acronym: "Laps", description: "Laps")
  Unit.create( acronym: "Rounds", description: "Rounds")
  Unit.create( acronym: "Time", description: "Duration in minutes and seconds")
  Unit.create( acronym: "cms", description: "Centimeters")
  Unit.create( acronym: "kgs", description: "Kilograms")
end

def create_measures
  { height: :cms, weight: :kgs, thigh: :cms, waist: :cms, hip: :cms}.each do |measure, unit|
    Measure.create(name: measure.to_s.capitalize, unit: Unit.find_by_acronym(unit.to_s))
  end
end

def create_exercises
  Exercise.create(name: 'Burpee')
  Exercise.create(name: 'Squat')
  Exercise.create(name: '400m')
  Exercise.create(name: 'Push-up')
  Exercise.create(name: 'Crunch')

end

def create_workouts
  reps = Unit.find_by_acronym("Reps")
  workout = Workout.create(name: 'legs', unit: Unit.find_by_acronym("Rounds"), description: "Rounds in 10 minutes")
  workout.supersets.build(sequence: 1, exercise: Exercise.find_by_name("Burpee"), unit: reps, amount: 10)
  workout.supersets.build(sequence: 2, exercise: Exercise.find_by_name("Squat"), unit: reps, amount: 10)

  workout = Workout.create(name: '4x400m', unit: Unit.find_by_acronym("Time"), description: "4 laps")
  workout.supersets.build(sequence: 1, exercise: Exercise.find_by_name("400m"), unit: Unit.find_by_acronym("laps"), amount: 4)

  workout = Workout.create(name: 'arms', unit: Unit.find_by_acronym("Reps"), description: "4 laps")
  workout.supersets.build(sequence: 1, exercise: Exercise.find_by_name("Push-up"), unit: Unit.find_by_acronym("Reps"), amount: 20)
  workout.supersets.build(sequence: 2, exercise: Exercise.find_by_name("Apple"), unit: Unit.find_by_acronym("Reps"), amount: 20)
end


def create_training_sessions
  training_date = 6.months.ago.beginning_of_week + 16.hours
  while training_date < (Date.today ) do
    4.times do |i|
      ts = TrainingSession.create(starts_at: training_date + i.days, minutes: 60, location: 'Stadium'  )
      puts ts.to_s
      PlannedWorkout.create( training_session: ts,  workout: Workout.all.shuffle.first)
    end
    training_date += 7.days
  end


end

def create_clients
  Client.delete_all
  clients = 10
  clients.times do |i|
    puts "Client #{i+1} out of #{clients}"
    fname = Faker::Name.first_name
    lname =  Faker::Name.last_name
    fullname = [fname,lname].join " "
    registration_date = Faker::Date.between(1.years.ago, 1.week.ago)
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

    TrainingSession.where("(starts_at > '#{registration_date}') AND (starts_at < '#{Date.today}')").each do |training_session|
      training_session.attendances.create(client: client) if (1..10).to_a.shuffle.first < 10 # 90% of attendance
    end
  end
end



def create_performances
  attendances = Attendance.count
  Attendance.all.each.with_index do |attendance,i|
    puts "Performance: #{i + 1} out of #{attendances}"
    attendance.training_session.planned_workouts.each do |planned_workout|
      attendance.performances.create(planned_workout: planned_workout, score: rand(3..59))
    end
  end
end


create_tariffs
create_units
create_measures
create_exercises
create_workouts
create_training_sessions
create_clients
create_performances
