Rails.application.routes.draw do
  devise_for :users
  root to: "appointments#index"
  resources :appointments, only: [:new, :create]
end
