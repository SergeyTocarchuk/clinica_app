ActiveAdmin.register Doctor do
  permit_params :phone, :name, :category_id, :password, :password_confirmation

  form do |f|
    f.inputs 'Doctor' do
      f.input :name
      f.input :phone
      f.input :password
      f.input :password_confirmation
      f.input :category_id, :as => :select, :collection => Category.all
    end
    f.actions
  end

end
