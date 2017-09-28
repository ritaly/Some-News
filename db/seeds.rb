# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |index|
  user = User.create!(username: Faker::Name.unique.name,
               email:  Faker::Internet.email,
               password: Faker::Lorem.characters(10))

  post = user.posts.build(
    title: Faker::Lorem.sentence,
    text: Faker::Lorem.paragraph(2) )

  user.comments.build(body: Faker::Lorem.paragraph,
                      post: post)
  user.save
end
