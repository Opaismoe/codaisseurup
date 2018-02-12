FactoryBot.define do
  factory :event do
    capacity            3
    name                { Faker::Lorem.words(3).join(' ') }
    description         { Faker::Lorem.sentence(40) }
    location            { Faker::Address.city }
    includes_food         true
    includes_drinks       true
    price               { Faker::Commerce.price }
    user                { build(:user) }
    starts_at           { Faker::Date.between(2.days.ago, Date.today)}
    ends_at             { Faker::Date.between(2.days.after, Date.today)}

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
