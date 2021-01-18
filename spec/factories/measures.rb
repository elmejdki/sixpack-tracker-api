FactoryBot.define do
  factory :measure do
    title { Faker::Lorem.word }
    unit { 'reps' }
    video { Faker::Lorem.word }
  end
end
