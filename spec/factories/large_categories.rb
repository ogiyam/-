FactoryBot.define do
  factory :large_category do
    association :user
    association :genre
      problem { Faker::Lorem.characters(number:5) }
      solution { Faker::Lorem.characters(number:20) }
  end
end