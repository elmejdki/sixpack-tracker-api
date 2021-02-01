include ActionDispatch::TestProcess

FactoryBot.define do
  factory :measure do
    title { Faker::Lorem.word }
    unit { 'reps' }
    video { Faker::Lorem.word }
    image { Rack::Test::UploadedFile.new('spec/support/assets/test-image.png', 'image/png') }
  end
end
