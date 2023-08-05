FactoryBot.define do
  factory :doctor do
    phone { Faker::PhoneNumber.phone_number }
    name  { 'Dr. Charles' }
    password { Faker::Internet.password }
    category { association :category }
  end
end
