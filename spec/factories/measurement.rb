FactoryBot.define do
  factory :measurement do
    value { Faker::Number.number(digits: 5) }
    user_id { 25 }
    measure_id { 12 }
  end
end