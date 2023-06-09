# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)

# #Lowell Seed
# # user_seed_1 = User.create(email: "33@gmail.com" , password: "123456", name: "Juan", last_name: "Jones")
# # user_seed_2 = User.create(email: "23@gmail.com" , password: "123456", name: "Lobo", last_name: "Wagon")

# # paco = Pet.new
# # paco.user = User.first
# # paco.name = "paco"
# # paco.save!

# # fido = Pet.new
# # fido.user = User.last
# # fido.name = "fido"
# # fido.save!

# # request_sample = AdoptionRequest.new
# # request_sample.user = User.last
# # request_sample.pet = Pet.second

# # Dan Seed

# User.create(
#   email: "test1@gmail.com",
#   name: "Daniel",
#   last_name: "Enrriquez",
#   age: 24,
#   preferences: "Dog",
#   address: "Niebla",
#   password: "1234567"
# )
# User.create(
#   email: "test2@gmail.com",
#   name: "Lowell",
#   last_name: "Alex",
#   age: 41,
#   preferences: "Dog",
#   address: "USA",
#   password: "1234567"
# )
# User.create(
#   email: "test3@gmail.com",
#   name: "Isaac",
#   last_name: "Lopez",
#   age: 28,
#   preferences: "Dog",
#   address: "Niebla",
#   password: "1234567"
# )
# Pet.create(
#   name: "Rocky",
#   species: "Dog",
#   breed: "Husky",
#   age: 5
# )
# # 25.times do
# #   Event.create(
# #     title: "Title #{rand(1..100)}",
# #     description: "Description #{rand(1..100)}",
# #     date: Date.today + rand(1..180),
# #     duration: rand(30..120),
# #     genre: GENRE.sample,
# #     user_id: all_user.sample.id,
# #     location: ["New York", "Los Angeles", "Chicago", "Houston", "Philadelphia"].sample
# #   )
# #   puts 'Done'
# # end


require 'faker'

puts 'Cleaning database...'
AdoptionRequest.destroy_all
Pet.destroy_all
User.destroy_all

3.times do |i|
  user = User.create(
    email: "test#{i + 1}@gmail.com",
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..60),
    preferences: ["Dog", "Cat"].sample,
    password: "123456"
  )
  2.times do
    pet = Pet.create(
      name: Faker::Creature::Dog.name,
      species: "Dog",
      breed: Faker::Creature::Dog.breed,
      age: rand(1..15),
      user_id: user.id
    )
    file = URI.open('https://source.unsplash.com/1600x900/?dog')
    pet.photo.attach(io: file, filename: 'dog.jpg', content_type: 'image/jpg')
  end
  Pet.create(
    name: Faker::Creature::Cat.name,
    species: "Cat",
    breed: Faker::Creature::Cat.breed,
    age: rand(1..15),
    user_id: user.id
  )
  file = URI.open('https://source.unsplash.com/1600x900/?cat')
  pet.photo.attach(io: file, filename: 'cat.jpg', content_type: 'image/jpg')
end
