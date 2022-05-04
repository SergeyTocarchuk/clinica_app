FactoryBot.define do
  factory :appointment do
    recommendation { FFaker::String }
    patient
    doctor
  end
end
