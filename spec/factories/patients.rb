FactoryBot.define do
  factory :patient do
    email { FFaker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end
end
