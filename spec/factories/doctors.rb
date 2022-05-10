FactoryBot.define do
  factory :doctor do
    phone { FFaker::PhoneNumber.cell_phone.gsub(/-/, '') }
    name { FFaker::Name.name }
    password { "password" }
    password_confirmation { "password" }
    category
  end
end
