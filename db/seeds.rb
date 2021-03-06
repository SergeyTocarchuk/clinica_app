# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'ffaker'

1..5.times do |num|
  Patient.create(phone: "38050456123#{num}", password: 'password', password_confirmation: 'password')
end

categories = ['surgeon', 'traumatologist', 'therapist', 'dentist']
categories.each do |category|
  Category.create(title: "#{category}")
end

1..9.times do |num|
  Doctor.create(phone: "38050123456#{num}", 
                password: 'password', 
                password_confirmation: 'password', 
                name: FFaker::Name.name,
                category_id: 1)
end

1..9.times do |num|
  Doctor.create(phone: "3805012345#{num}0", 
                password: 'password', 
                password_confirmation: 'password', 
                name: FFaker::Name.name,
                category_id: 2)
end

1..9.times do |num|
  Doctor.create(phone: "380501234#{num}10", 
                password: 'password', 
                password_confirmation: 'password', 
                name: FFaker::Name.name,
                category_id: 3)
end

1..9.times do |num|
  Doctor.create(phone: "38050123#{num}100", 
                password: 'password', 
                password_confirmation: 'password', 
                name: FFaker::Name.name,
                category_id: 4)
end

AdminUser.create!(phone: "380507654321", password: 'password', password_confirmation: 'password')