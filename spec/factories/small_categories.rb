FactoryBot.define do
  factory :small_category do
    association :large_category
      title { Faker::Lorem.characters(number:5) }
      note { Faker::Lorem.characters(number:20) }
  end
end