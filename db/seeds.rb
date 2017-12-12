Category.destroy_all
Event.destroy_all

opa = User.new(email: "opaismoe@gmail.com", password: "123456")
oma = User.new(email: "omaismoe@gmail.com", password: "123456")
groot_opa = User.new(email: "grootopaisookmoe@gmail.com", password: "123456")

night_life = Category.create!(name: "Night life")
learning = Category.create!(name: "Learning")
culture = Category.create!(name: "Culture")
music = Category.create!(name: "Music")
gatherings = Category.create!(name: "Gatherings")

Event.create!(
  name: "Coffee party",
  user: opa,
  description:"We love coffe and we're gonne drink loads of it!",
  location: "Amsterdam, westerpark.",
  starts_at: "2017-12-12 22:15:18",
  ends_at: "2017-13-12 13:15:18",
  price:15,
  categories: [learning, culture],
)

Event.create!(
  name: "Tea party",
  user: opa,
  description:"Go do that somewhere else the coffe party said, well here it is. in a different part of the town! for you tea lovers",
  location: "Amsterdam, Noorderpark.",
  starts_at: "2017-12-12 22:15:18",
  ends_at: "2017-13-12 22:15:18",
  price:15,
  categories: [learning, culture],
)

Event.create!(
  name: "Wine & dine",
  user: opa,
  description:"Yeah you know, it's for you fancy folks out that that like some wine and maybe some food to go with that.",
  location: "Amsterdam, Vondelpark.",
  starts_at: "2017-12-12 22:15:18",
  ends_at: "2017-13-12 22:15:18",
  price:15,
  categories: [night_life, gatherings],
)

Event.create!(
  name: "Read chinese backwards",
  user: opa,
  description:"Or in other words, the right way?.",
  location: "Arnhem, je moeder.",
  starts_at: "2017-12-12 22:15:18",
  ends_at: "2017-13-12 22:15:18",
  price:15,
  categories: [learning, culture, music],
)

Event.create!(
  name: "Destory a bakfiets",
  user: opa,
  description:"A bakfiets you said? yes a bakfiets! kill it with fire!.",
  location: "Amsterdam, Vondelpark.",
  starts_at: "2017-12-12 22:15:18",
  ends_at: "2017-13-12 22:15:18",
  price:15,
  categories: [learning, culture, night_life, music],
)

Event.create!(
  name: "Old dutch vliegeren",
  user: opa,
  description:"Sounds dirty? well it aint! you perverd.",
  location: "Amsterdam, Vondelpark.",
  starts_at: "2017-12-12 22:15:18",
  ends_at: "2017-13-12 22:15:18",
  price:15,
  categories: [culture],
)

puts "Gave it #{User.count} user"
puts "Gave it #{Event.count} Events"
puts "Gave it #{Category.count} categories"
