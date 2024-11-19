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

puts "Creating dogs..."

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

users = User.all

chew_barka = Dog.create(
  name: "Chew-Barka",
  breed: "Golden Retriever",
  age: 1,
  price: rand(20.100),
  size: "Large",
  description: "Meet our delightful golden retriever, the epitome of loyalty and warmth! With a luxurious golden coat and a heart as golden as its fur, this pup is ideal for any dog lover looking for a day of joy and companionship. Known for their friendly and gentle nature, golden retrievers are fantastic with kids, adults, and even other pets.",
  user_id: users.sample.id
)

barktholomew = Dog.create(
  name: "Barktholomew",
  breed: "German Shepherd",
  age: 5,
  price: rand(20..100),
  size: "Large",
  description: "Say hello to our magnificent German Shepherd, the ideal partner for those seeking loyalty, intelligence, and energy wrapped into one incredible canine. With their sleek coat, striking features, and alert demeanor, German Shepherds are renowned for their versatility and loving nature.",
  user_id: users.sample.id
)

Booking.create(
  start_date: Time.now,
  end_date: (Time.now + 3),
  price: rand(20..100),
  user: adam,
  dog: chew_barka
)

Booking.create(
  start_date: Time.now,
  end_date: (Time.now + 3),
  price: rand(20..100),
  user: ellie,
  dog: barktholomew
)

puts "Created #{Dog.count} dogs, #{User.count} users and #{Booking.count} bookings."
