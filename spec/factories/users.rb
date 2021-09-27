FactoryBot.define do
  factory :user do
    name {'あおい'}
    email { Faker::Internet.free_email }
    password { 'aaaaaa' }
  end
end