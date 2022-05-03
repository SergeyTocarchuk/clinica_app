FactoryBot.define do
  factory :doctor do
    email { FFaker::Internet.email }
    name { FFaker::Name.name }
    password { "password" }
    password_confirmation { "password" }
    category
  end
end
