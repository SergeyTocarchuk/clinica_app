FactoryBot.define do
  factory :appointment do
    recommendation { Faker::Lorem.sentence(word_count: 3) }
    patient
    doctor
  end
end
