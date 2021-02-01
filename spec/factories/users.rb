FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { 'foo@bar.com' }
    role { 'admin' }
    password { 'foobar' }
  end
end
