Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config 
  ActiveAdmin.routes(self)

  mount ActionCable.server => '/cable'

  devise_for :doctors, path: 'doctors'
  devise_for :patients, path: 'patients' do
    get '/patients/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'pages#home'

  patch '/appointments/:appointment_id/add_recommendation', to: 'appointments#add_recommendation', as: :recommendations

  resources :categories, only: :show
  resources :doctors, only: :show do
    resources :appointments, only: %i[show create]
  end
  resources :patients, only: :show do
    resources :appointments, only: :update
  end
end
