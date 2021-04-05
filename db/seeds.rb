# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
200.times do

p = Post.create(
    title: Faker::Hacker.say_something_smart,
    body: Faker::ChuckNorris.fact,
    # We can use the user instance for the "user" attribute rather than using "user_id"
  )
end

puts Cowsay.say("Generated #{Post.count} posts", :koala)

