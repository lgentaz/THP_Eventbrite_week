# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
    user = User.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        description: Faker::Hipster.sentence,
        encrypted_password: "bonjour",
    )
    user.email = "#{user.first_name}.#{user.last_name}@yopmail.com"
    user.save
end
puts "10 utilisateurs créés"

5.times do
    event = Event.create(
        start_date: Faker::Time.forward(days: 100, format: :long),
        duration: [15, 30, 45, 60, 90, 120, 150].sample,
        title: Faker::Movies::HarryPotter.spell,
        description: Faker::ChuckNorris.fact,
        price: rand(40..200),
        location: Faker::Nation.capital_city,
        admin: User.all.sample,    
    )
end
puts "3 évènements créés"

20.times do
    attendance = Attendance.create(
        event: Event.all.sample,
        guest: User.all.sample,
        stripe_customer_id: Faker::Invoice.reference,
    )
end
puts "15 présences confirmées"