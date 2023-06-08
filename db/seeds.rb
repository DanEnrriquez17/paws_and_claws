# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Lowell Seed
# user_seed_1 = User.create(email: "33@gmail.com" , password: "123456", name: "Juan", last_name: "Jones")
# user_seed_2 = User.create(email: "23@gmail.com" , password: "123456", name: "Lobo", last_name: "Wagon")

# paco = Pet.new
# paco.user = User.first
# paco.name = "paco"
# paco.save!

# fido = Pet.new
# fido.user = User.last
# fido.name = "fido"
# fido.save!

# request_sample = AdoptionRequest.new
# request_sample.user = User.last
# request_sample.pet = Pet.first

# Dan Seed

User.create(
  email: "test1@gmail.com",
  name: "Daniel",
  last_name: "Enrriquez",
  age: 24,
  preferences: "Dog",
  address: "Niebla"
)
User.create(
  email: "test2@gmail.com",
  name: "Lowell",
  last_name: "Alex",
  age: 41,
  preferences: "Dog",
  address: "USA"
)
User.create(
  email: "test3@gmail.com",
  name: "Isaac",
  last_name: "Lopez",
  age: 28,
  preferences: "Dog",
  address: "Niebla"
)
User.create(
  email: "test4@gmail.com",
  name: "Guillaume",
  last_name: "Soyer",
  age: 35,
  preferences: "Dog",
  address: "Niebla"
)
User.create(
  email: "test5@gmail.com",
  name: "Salomon",
  last_name: "Charabati",
  age: 27,
  preferences: "Dog",
  address: "Niebla"
)
# 25.times do
#   Event.create(
#     title: "Title #{rand(1..100)}",
#     description: "Description #{rand(1..100)}",
#     date: Date.today + rand(1..180),
#     duration: rand(30..120),
#     genre: GENRE.sample,
#     user_id: all_user.sample.id,
#     location: ["New York", "Los Angeles", "Chicago", "Houston", "Philadelphia"].sample
#   )
#   puts 'Done'
# end
