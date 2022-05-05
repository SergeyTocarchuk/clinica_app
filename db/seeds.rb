# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'ffaker'

1..5.times do |num|
  Patient.create(email: "patient_#{num}@example.com", password: 'password', password_confirmation: 'password')
end

categories = ['surgeon', 'traumatologist', 'therapist', 'dentist']
categories.each do |category|
  Category.create(title: "#{category}")
end

1..20.times do |num|
  Doctor.create(email: "doctor_#{num}@clinic.com", 
                password: 'password', 
                password_confirmation: 'password', 
                name: FFaker::Name.name,
                category_id: 1)
end

21..40.times do |num|
  Doctor.create(email: "doctor_#{num}@clinic.com", 
                password: 'password', 
                password_confirmation: 'password', 
                name: FFaker::Name.name,
                category_id: 2)
end

41..60.times do |num|
  Doctor.create(email: "doctor_#{num}@clinic.com", 
                password: 'password', 
                password_confirmation: 'password', 
                name: FFaker::Name.name,
                category_id: 3)
end

61..80.times do |num|
  Doctor.create(email: "doctor_#{num}@clinic.com", 
                password: 'password', 
                password_confirmation: 'password', 
                name: FFaker::Name.name,
                category_id: 4)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?