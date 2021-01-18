FactoryBot.define do
  factory :measurement do
    value { Faker::Number.number(digits: 5) }
    user_id { Faker::Number.number(digits: 10) }
    measure_id { Faker::Number.number(digits: 10) }
  end
end
