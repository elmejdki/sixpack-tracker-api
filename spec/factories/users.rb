FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { 'foo@bar.com' }
    role { 'user' }
    password { 'foobar' }
  end
end