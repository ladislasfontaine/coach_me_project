# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

City.destroy_all
Objective.destroy_all
User.destroy_all
Datum.destroy_all
Coach.destroy_all
CoachSpecialty.destroy_all
Specialty.destroy_all
Seance.destroy_all

cities = []
objectives = []
users = []
coaches = []
specialties = []
seances = []

objectives_initialize = ["A définir", "Perdre du poids", "Gagner en masse musculaire", "Préparer une compétition", "Juste pour le fun", "Réduire mon stress"]
specialties_initialize = ["Tous les sports", "Boxe", "Yoga", "Course", "Musculation", "Danse", "Pilates", "Triathlon"]
cities_initialize = ["A définir", "Paris", "Bordeaux", "Lyon", "Nantes", "Marseille", "Lille", "Rennes", "Strasbourg"]
durations_initialize = [60, 90, 120]

cities_initialize.each do |city|
  cities << City.create(name: city)
end

objectives_initialize.each do |objective|
  objectives << Objective.create(description: objective)
end

specialties_initialize.each do |s|
	specialties << Specialty.create(name: s)
end

  coach_1 = Coach.create(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_1
  coach_1.avatar.attach(io: File.open('app/assets/images/coachw/coachw1.jpg'), filename: 'coachw1.jpg')

  2.times do |index|
    CoachSpecialty.create(coach: coach_1, specialty: specialties.sample)
  end
puts "coach_1 ok "

  coach_2 = Coach.create(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_2
  coach_2.avatar.attach(io: File.open('app/assets/images/coachw/coachw2.jpg'), filename: 'coachw2.jpg')
    2.times do |index|
    CoachSpecialty.create(coach: coach_2, specialty: specialties.sample)
  end

  puts "coach_2 ok"


    coach_3 = Coach.create(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_3
  coach_3.avatar.attach(io: File.open('app/assets/images/coachw/coachw3.jpg'), filename: 'coachw2.jpg')
    2.times do |index|
    CoachSpecialty.create(coach: coach_3, specialty: specialties.sample)
  end

  puts "coach_3 ok"

    coach_4 = Coach.create(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_4
  coach_4.avatar.attach(io: File.open('app/assets/images/coachw/coachw4.jpg'), filename: 'coachw4.jpg')
    2.times do |index|
    CoachSpecialty.create(coach: coach_4, specialty: specialties.sample)
  end

  puts "coach_4 ok"

    coach_5 = Coach.create(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_5
  coach_5.avatar.attach(io: File.open('app/assets/images/coachw/coachw5.jpg'), filename: 'coachw5.jpg')
    2.times do |index|
    CoachSpecialty.create(coach: coach_5, specialty: specialties.sample)
  end

  puts "coach_5 ok"


    coach_6 = Coach.create(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_6
  coach_6.avatar.attach(io: File.open('app/assets/images/coachm/coachm1.jpg'), filename: 'coachm1.jpg')
    2.times do |index|
    CoachSpecialty.create(coach: coach_6, specialty: specialties.sample)
  end

  puts "coach_6 ok"


    coach_7 = Coach.create(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_7
  coach_7.avatar.attach(io: File.open('app/assets/images/coachm/coachm2.jpg'), filename: 'coachm2.jpg')

    2.times do |index|
    CoachSpecialty.create(coach: coach_7, specialty: specialties.sample)
  end
  puts "coach_7 ok"


    coach_8 = Coach.create(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_8
  coach_8.avatar.attach(io: File.open('app/assets/images/coachm/coachm3.jpg'), filename: 'coachm3.jpg')
    2.times do |index|
    CoachSpecialty.create(coach: coach_8, specialty: specialties.sample)
  end

  puts "coach_8 ok"

    coach_9 = Coach.create(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_9
  coach_9.avatar.attach(io: File.open('app/assets/images/coachm/coachm4.jpg'), filename: 'coachm4.jpg')
    2.times do |index|
    CoachSpecialty.create(coach: coach_9, specialty: specialties.sample)
  end

  puts "coach_9 ok"

    coach_10 = Coach.create(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_10
  coach_10.avatar.attach(io: File.open('app/assets/images/coachm/coachm5.jpg'), filename: 'coachm5.jpg')
    2.times do |index|
    CoachSpecialty.create(coach: coach_10, specialty: specialties.sample)
  end

  puts "coach_10 ok"



10.times do |index|
  coach_instance = Coach.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    siret: Faker::Number.number(digits: 9).to_i,
    price: 50,
    account_number: "DE71540515507992382247",
    account_name: Faker::Name.name
  )
  coaches << coach_instance
  coach_instance.avatar.attach(io: File.open('app/assets/images/default.jpg'), filename: 'default.jpg')
  2.times do |index|
    CoachSpecialty.create(coach: coach_instance, specialty: specialties.sample)
  end
end
puts "coach ok"



  user_1 = User.create(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_1
  user_1.avatar.attach(io: File.open('app/assets/images/profilew/women1.jpg'), filename: 'women1.jpg')

  puts "user_1 ok"


  user_2 = User.create(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_2
  user_1.avatar.attach(io: File.open('app/assets/images/profilew/women2.jpg'), filename: 'women2.jpg')

  puts "user_2 ok"

  user_3 = User.create(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_3
  user_3.avatar.attach(io: File.open('app/assets/images/profilew/women3.jpg'), filename: 'women3.jpg')

  puts "user_3 ok"

  user_4 = User.create(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_4
  user_4.avatar.attach(io: File.open('app/assets/images/profilew/women4.jpg'), filename: 'women4.jpg')

  puts "user_4 ok"


  user_5 = User.create(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_5
  user_5.avatar.attach(io: File.open('app/assets/images/profilew/women5.jpg'), filename: 'women5.jpg')

  puts "user_5 ok"

    user_6 = User.create(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_6
  user_6.avatar.attach(io: File.open('app/assets/images/profilem/men1.jpg'), filename: 'men1.jpg')

  puts "user_6 ok"


    user_7 = User.create(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_7
  user_7.avatar.attach(io: File.open('app/assets/images/profilem/men2.jpg'), filename: 'men2.jpg')

  puts "user_7 ok"


    user_8 = User.create(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_8
  user_8.avatar.attach(io: File.open('app/assets/images/profilem/men3.jpg'), filename: 'men3.jpg')

  puts "user_8 ok"

    user_9 = User.create(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_9
  user_9.avatar.attach(io: File.open('app/assets/images/profilem/men4.jpg'), filename: 'men4.jpg')

  puts "user_9 ok"


    user_10 = User.create(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_10
  user_6.avatar.attach(io: File.open('app/assets/images/profilem/men5.jpg'), filename: 'men5.jpg')

  puts "user_10 ok"


10.times do |index|
  user_instance = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    birth_date: DateTime.new(rand(1950..2000),rand(1..12),rand(1..28)),
    phone_number: "(+33)" + Faker::PhoneNumber.subscriber_number(length: 9),
    address: Faker::Address.street_address,
    city: cities.sample,
    zip_code: Faker::Address.zip_code,
    description: Faker::Quote.famous_last_words,
    objective: objectives.sample

  )
  users << user_instance
  user_instance.avatar.attach(io: File.open('app/assets/images/default.jpg'), filename: 'default.jpg')
end
puts "user ok"

25.times do
  Datum.create(height: rand(155..198), weight: rand(40.4..109.9), user: users.sample)
end
puts "Data ok"

15.times do |index|
  seances << Seance.create(
    coach: coaches.sample,
    user: users.sample,
    place: "Stade de France",
    duration: durations_initialize.sample,
    start_date: DateTime.new(rand(2019..2020),rand(1..12),rand(1..28))
  )
end
puts "Seance ok"
