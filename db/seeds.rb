# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all

coaches = []

specialties_initialize = ["Boxe", "Yoga", "Course"]
specialties = []

cities = []

cities_initialize = ["Paris", "Bordeaux", "Lyon", "Nantes", "Marseille", "Lille", "Rennes", "Strasbourg"]

cities_initialize.each do |city|
  cities << City.create(name: city)
end
puts 'ok'

10.times do |index|
  coaches << Coach.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
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

puts 'ok'

specialties_initialize.each do |s|
	specialties << Specialty.create(
		name: s
		)
end	
 puts "Ok"


 10.times do |index|
 	CoachSpecialty.create(
		coach: coaches.sample,
		specialty: specialties.sample
 		)
end

puts "ok"
 

    