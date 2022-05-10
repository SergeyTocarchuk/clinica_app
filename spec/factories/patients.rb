FactoryBot.define do
  factory :patient do
    phone { FFaker::PhoneNumber.cell_phone.gsub(/-/, '') }
    password { "password" }
    password_confirmation { "password" }
  end
end
