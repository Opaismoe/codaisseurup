Category.destroy_all
Event.destroy_all
Photo.delete_all
Profile.destroy_all
User.destroy_all

opa = User.create!(email: "wiebe@gmail.com", password: "123456")

# Users
users = []
60.times do
  users << User.create(
    email: Faker::Internet.email,
    password: "abcd1234"
  )
end

# Categories
categories = []
categories << Category.create!(name: "Night life")
categories <<  Category.create!(name: "Learning")
categories <<  Category.create!(name: "Culture")
categories <<  Category.create!(name: "Music")
categories <<  Category.create!(name: "Gatherings")

event1 = Event.create!(
  name: "Coffee party",
  user: opa,
  description:"We love coffe and we're gonne drink loads of it!",
  location: "Amsterdam, westerpark.",
  starts_at: "2017-12-12 22:15:18",
  ends_at: "2017-13-12 13:15:18",
  price:15,
  capacity: 5,
  categories: categories.sample(rand(0..4)),
  includes_drinks: true,
)

# Events
events = []
users.sample(15).each do |user|
  events << Event.create(
    name: Faker::Company.bs,
    user: user,
    price: rand(15..25),
    location: Faker::Address.city,
    starts_at:Faker::Date.between(3.year.ago, 1.years.from_now),
    ends_at: Faker::Date.between(1.years.from_now, 2.years.from_now),
    categories: categories.sample(rand(0..4)),
    capacity: rand(1..25),
    includes_drinks:[true, false].sample,
    includes_food:[true, false].sample,
    description: Faker::Hipster.paragraph,
  )
end

events.sample(10).each do |event|
  Registration.create!(
    event: event,
    status: true,
    guest_count: rand(1..25),
  )
end

puts "Gave it #{User.count} user"
puts "Gave it #{Event.count} Events"
puts "Gave it #{Category.count} categories"
puts "Gave it #{Registration.count} new registrations"
