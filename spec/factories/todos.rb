FactoryBot.define do
  factory :todo do
      task { Faker::Lorem.characters(number:5) }
  end
end