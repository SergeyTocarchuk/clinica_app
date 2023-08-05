FactoryBot.define do
  factory :patient do
    phone { Faker::PhoneNumber.phone_number }
    password { Faker::Internet.password }
  end
end
