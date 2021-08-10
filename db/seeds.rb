# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'



User.create!(username: 'Vince',
            email: "vince@example.com",
            password: 'password',
            password_confirmation: "password",
            admin: true)




25.times do |i|
    project = Project.new
    project.ref_num = Faker::Lorem.paragraph_by_chars(number: 5)
    project.postcode = Faker::Lorem.paragraph_by_chars(number: 5)
    project.body = Faker::Lorem.paragraph_by_chars(number: 1500)
    project.user = User.first
    project.thumbnail.attach(io: URI.parse("https://picsum.photos/1920/1080").open, filename: "#{i}_thumbnail.jpg")
    project.banner.attach(io: URI.parse("https://picsum.photos/1920/1080").open, filename: "#{i}_banner.jpg")
    project.views = Faker::Number.between(from: 1, to: 5000)
    project.save

end