FactoryBot.define do
  factory :chat do
    patient { association :patient }
    doctor { association :doctor }

    trait :with_patient_message do
      after(:create) do |chat|
        Patient.last.messages.create(chat_id: chat.id, content: 'Hello from patient')
      end
    end

    trait :with_doctor_message do
      after(:create) do |chat|
        Doctor.last.messages.create(chat_id: chat.id, content: 'Hello from doctor')
      end
    end
  end
end
