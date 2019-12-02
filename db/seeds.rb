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

cities_initialize = ["Paris", "Bordeaux", "Lyon", "Nantes", "Marseille", "Lille", "Rennes", "Strasbourg"]
objectives_initialize = ["Perdre du poids", "Gagner en masse musculaire", "Préparer une compétition", "Juste pour le fun", "Réduire mon stress"]
specialties_initialize = ["Boxe", "Yoga", "Course"]
cities_initialize = ["Paris", "Bordeaux", "Lyon", "Nantes", "Marseille", "Lille", "Rennes", "Strasbourg"]

cities_initialize.each do |city|
  cities << City.create(name: city)
end

objectives_initialize.each do |objective|
  objectives << Objective.create(description: objective)
end

10.times do |index|
  coaches << Coach.create(
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
end

specialties_initialize.each do |s|
	specialties << Specialty.create(name: s)
end

 10.times do |index|
 	CoachSpecialty.create(coach: coaches.sample, specialty: specialties.sample)
end

10.times do |index|
  users << User.create(
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
end

20.times do
  Datum.create(height: rand(155..198), weight: rand(40.4..109.9), user: users.sample)
end

10.times do |index|
  seances << Seance.create(
    coach: coaches.sample, 
    user: users.sample, 
    duration: rand(1..5), 
    start_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 60)
  )
end
