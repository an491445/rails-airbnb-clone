# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Booking.destroy_all
Minivan.destroy_all
User.destroy_all
Profile.destroy_all

users = []
5.times do
  users << User.new(email: Faker::Internet.email)
  users[-1].save
end


5.times do |i|
  profile = Profile.new(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    driver_license: true)
  profile.user = users[i]
  profile.save
end

minivans = []

2.times do |i|
  minivan = Minivan.new(capacity: 6, model_year: 1978 + rand(40), gearbox:"manual",
    picture: "https://www.bunnyholder.com/600/600", price_per_day: rand(51),
    location: Faker::Address.city, description: Faker::Vehicle.manufacture)
  minivan.user = users[5-i]
  minivan.save
  minivans << minivan
end

3.times do |i|
  booking = Booking.new(price: 20 + rand(100),
    start_time: Time.new(2017, 6, 4, 2, 2, 2, "+01:00"),
    end_time: Time.new(2017, 6, 10, 10, 30, 0, "+01:00"))
  booking.user = users[i]
  booking.minivan = minivans[i % 2]
  booking.save
end
