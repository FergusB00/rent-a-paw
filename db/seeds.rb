# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

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

dog_types = [
  { type: "Labrador", image_name: "https://cdn.britannica.com/82/232782-050-8062ACFA/Black-labrador-retriever-dog.jpg" },
  { type: "Cocker Spaniel", image_name: "https://cdn.britannica.com/35/38935-050-E4DE59E9/Cocker-spaniel.jpg" },
  { type: "Dachshund", image_name: "https://cdn.britannica.com/81/12481-050-6FF2A457/dachshund-coat-hair.jpg" },
  { type: "German Shepherd", image_name: "https://cdn.britannica.com/79/232779-050-6B0411D7/German-Shepherd-dog-Alsatian.jpg" },
  { type: "Jack Russell", image_name: "https://cdn.britannica.com/32/8132-050-FD658B0B/terrier-Parson-Jack-Russell.jpg" },
  { type: "Chihuahua", image_name: "https://cdn.britannica.com/44/233244-050-A65D4571/Chihuahua-dog.jpg" },
  { type: "Collie", image_name: "https://cdn.britannica.com/25/234625-050-6070814C/Border-Collie-dog.jpg" },
  { type: "Greyhound", image_name: "https://apupabove.com/cdn/shop/articles/Italian_Greyhound_Basic_Care_Guide_1200x1200.webp?v=1701708859" },
  { type: "Husky", image_name: "https://cdn.britannica.com/84/232784-050-1769B477/Siberian-Husky-dog.jpg" },
  { type: "Schnauzer", image_name: "https://cdn.britannica.com/46/79546-050-1B8F54F4/Miniature-schnauzer.jpg" },
  { type: "Dalmatian", image_name: "https://cdn.britannica.com/47/236047-050-F06BFC5E/Dalmatian-dog.jpg" },
  { type: "Labrador", image_name: "https://cdn.britannica.com/68/28268-004-53E03392.jpg" },
  { type: "Labrador", image_name: "https://media.graphassets.com/resize=height:360,width:1280/output=format:webp/AX2WeBpHQImdIope0Vlk?width=1280" }
]

dog_types.each do |dog|
  Dog.create(
    name: Faker::Creature::Dog.name,
    breed: dog[:type],
    image_url: dog[:image_name],
    age: rand(1..12),
    price: rand(20..100),
    size: "Large",
    description: Faker::Creature::Dog.meme_phrase,
    user_id: users.sample.id
  )
end

# 16.times do
#   Dog.create(
#     name: Faker::Creature::Dog.name,
#     breed: Faker::Creature::Dog.breed,
#     image_url: "landing/dog_4.jpg",
#     age: rand(1..12),
#     price: rand(20..100),
#     size: "Large",
#     description: Faker::Creature::Dog.meme_phrase,
#     user_id: users.sample.id
#   )
# end



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
