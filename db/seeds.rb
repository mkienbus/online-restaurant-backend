# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'faker'

User.create([
    {username: 'mkienbus', password: "test", email: "canonbusch@hotmail.com"},
    {username: 'test', password: "test"}
])

# generate 20 users
(1..20).each do |id|
    User.create!(
# each user is assigned an id from 1-20
        username: Faker::Name.unique.first_name,
        #email: Faker::Internet.email, may want to include later with email notifications
# issue each user the same password
        password: "test", 
        password_confirmation: "test"
    )
end

#generate 20 retaurants
(1..20).each do |id|
    Restaurant.create!(
        name: Faker::Restaurant.unique.name,
        address: Faker::Address.full_address
    )
end

#generate reservations for mkienbus id:1 and test id:2
Reservation.create([
    {user_id: 1, restaurant_id: 1, reservation_date: "12/25/2022"},
    {user_id: 1, restaurant_id: 3, reservation_date: "5/19/2022"},
    {user_id: 2, restaurant_id: 2, reservation_date: "1/1/2023"}
])

puts "database seeded!"