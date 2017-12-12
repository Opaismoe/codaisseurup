
puts "destroyed all the Users and Events"

opa = User.new(email: "opaismoe@gmail.com", password: "123456")
oma = User.new(email: "omaismoe@gmail.com", password: "123456")

Event.create!(name: "Coffee party", user: opa, description:"Place some info here so the people can see what")
Event.create!(name: "Thee party", user: oma, description:"Place some info here so the people can see what")
Event.create!(name: "Goodmorning netherlands", user: opa, description:"Place some info here so the people can see what")
Event.create!(name: "Drinking whiskey", user: opa, description:"Place some info here so the people can see what")
Event.create!(name: "Learn mandarin", user: opa, description:"Place some info here so the people can see what")
Event.create!(name: "Learn full-stack cooking", user: opa, description:"Place some info here so the people can see what")

Category.create!(name: "Night life")
Category.create!(name: "Learning")
Category.create!(name: "Culture")
Category.create!(name: "Music")
Category.create!(name: "Gatherings")

puts "Gave it #{User.count} users"
puts "Gave it #{Event.count} Events"
puts "Gave it #{Category.count} categories"
