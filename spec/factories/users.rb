FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'aaaaaa' }
    password_confirmation { "aaaaaa" }
  end
end

