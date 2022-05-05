Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config 
  ActiveAdmin.routes(self)

  devise_for :doctors, path: 'doctors'
  devise_for :patients, path: 'patients'

  root to: "categories#index"

  resources :categories, :only => [:show]
end
