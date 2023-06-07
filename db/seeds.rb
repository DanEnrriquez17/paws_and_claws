# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_seed_1 = User.create(email: "33@gmail.com" , password: "123456", name: "Juan", last_name: "Jones")
user_seed_2 = User.create(email: "23@gmail.com" , password: "123456", name: "Lobo", last_name: "Wagon")

paco = Pet.new
paco.user = User.first
paco.name = "paco"
paco.save!

fido = Pet.new
fido.user = User.last
fido.name = "fido"
fido.save!

request_sample = AdoptionRequest.new
request_sample.user = User.last
request_sample.pet = Pet.first

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
