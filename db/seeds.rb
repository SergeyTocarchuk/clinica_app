Patient.create(phone: "380504561230",
               password: 'password',
               password_confirmation: 'password')

categories = ['therapist', 'traumatologist', 'dentist']
categories.each do |category|
  Category.create(title: "#{category}")
end

Doctor.create(phone: "380501234560", 
              password: 'password', 
              password_confirmation: 'password', 
              name: 'Dr. Charles',
              category_id: Category.first.id)

AdminUser.create(phone: "380507654321", password: 'password', password_confirmation: 'password')
