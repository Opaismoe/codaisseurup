FactoryBot.define do
  factory :event do
    capacity            3
    listing_name        { Faker::Lorem.words(3).join(' ') }
    description         { Faker::Lorem.sentence(40) }
    location            { Faker::Address.city }
    includes_food         true
    includes_drinks       true
    price                { Faker::Commerce.price }
    user                { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
