Rails.application.routes.draw do
  devise_for :doctors, path: 'doctors'
  devise_for :patients, path: 'patients'

  root to: "categories#index"
end
