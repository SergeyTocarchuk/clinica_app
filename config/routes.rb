Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config 
  ActiveAdmin.routes(self)

  devise_for :doctors, path: 'doctors'
  devise_for :patients, path: 'patients' do
    get '/patients/sign_out' => 'devise/sessions#destroy'
  end

  root to: "categories#index"

  resources :categories, :only => [:show]
  resources :doctors, :only => [:show] do
    resources :appointments, :only => [:create]
  end
  resources :patients, :only => [:show]
end
