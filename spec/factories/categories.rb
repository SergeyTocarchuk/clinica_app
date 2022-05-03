FactoryBot.define do
  factory :category do
    title { ['surgeon', 'traumatologist', 'therapist', 'dentist'].sample }
  end
end
