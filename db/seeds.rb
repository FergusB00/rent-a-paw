# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Booking.destroy_all
Dog.destroy_all
User.destroy_all

puts "Creating users..."

adam = User.create(
  first_name: "Adam",
  last_name: "Jones",
  email: "adam@jones.com",
  password: "password"
)

ellie = User.create!(
  first_name: "Ellie",
  last_name: "Stevens",
  email: "ellie@stevens.com",
  password: "password"
)

colin = User.create!(
  first_name: "Colin",
  last_name: "Warne",
  email: "colin@warne.com",
  password: "password"
)

alice = User.create!(
  first_name: "Alice",
  last_name: "Evans",
  email: "alice@evans.com",
  password: "password"
)

users = User.all

puts "Created #{User.count} users."

puts "Creating dogs..."

20.times do
  Dog.create(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    image_url: "landing/dog_4.jpg",
    age: rand(1..12),
    price: rand(20..100),
    size: "Large",
    description: Faker::Creature::Dog.meme_phrase,
    user_id: users.sample.id
  )
end

dogs = Dog.all

puts "Created #{Dog.count} dogs."

8.times do
  Booking.create(
    start_date: (Time.now + rand(0..2).days),
    end_date: (Time.now + rand(2..5).days),
    user: users.sample,
    dog: dogs.sample
  )
end

puts "Created #{Booking.count} bookings."
