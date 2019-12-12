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

10.times do |index|
  coach_female = Coach.create(
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
  coaches << coach_female
  2.times do |i|
    CoachSpecialty.create(coach: coach_female, specialty: specialties.sample)
  end
end

coaches[0].avatar.attach(io: File.open("app/assets/images/coachw/coachw1.jpg"), filename: 'coachw1.jpg', content_type: 'application/jpg')
coaches[0].avatar.analyze
coaches[1].avatar.attach(io: File.open('app/assets/images/coachw/coachw2.jpg'), filename: 'coachw2.jpg')
coaches[2].avatar.attach(io: File.open('app/assets/images/coachw/coachw3.jpg'), filename: 'coachw2.jpg')
coaches[3].avatar.attach(io: File.open('app/assets/images/coachw/coachw4.jpg'), filename: 'coachw4.jpg')
coaches[4].avatar.attach(io: File.open('app/assets/images/coachw/coachw5.jpg'), filename: 'coachw5.jpg')

puts "Women Coaches Ok"

10.times do |index|
    coach_male = Coach.create(
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
  coaches << coach_male
  2.times do |i|
    CoachSpecialty.create(coach: coach_male, specialty: specialties.sample)
  end
end

coaches[5].avatar.attach(io: File.open('app/assets/images/coachm/coachm1.jpg'), filename: 'coachm1.jpg')
coaches[6].avatar.attach(io: File.open('app/assets/images/coachm/coachm2.jpg'), filename: 'coachm2.jpg')
coaches[7].avatar.attach(io: File.open('app/assets/images/coachm/coachm3.jpg'), filename: 'coachm3.jpg')
coaches[8].avatar.attach(io: File.open('app/assets/images/coachm/coachm4.jpg'), filename: 'coachm4.jpg')
coaches[9].avatar.attach(io: File.open('app/assets/images/coachm/coachm5.jpg'), filename: 'coachm5.jpg')

puts "Male Coaches Ok "

20.times do |index|
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
end

puts "Users Ok"

25.times do
  Datum.create(height: rand(155..198), weight: rand(40.4..109.9), user: users.sample)
end
puts "Data Ok"

30.times do |index|
  seances << Seance.create(
    coach: coaches.sample,
    user: users.sample,
    place: "Stade de France",
    duration: durations_initialize.sample,
    start_date: DateTime.new(rand(2019..2020),rand(1..12),rand(1..28))
  )
end
puts "Seance Ok"
