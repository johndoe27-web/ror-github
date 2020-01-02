# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

# create! will output error feedback, if there is, in the terminal
# change email to your own personal email
User.create!(
  name: "John Doe",
  email: "example@railstutorial.org",
  password: "password"
)

50.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password"
  )
end

users = User.order(:created_at).take(6)

50.times do
  content = Faker::OnePiece.quote
  users.each { |user| user.microposts.create!(content: content) }
end
