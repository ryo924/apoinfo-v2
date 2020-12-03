Rails.application.routes.draw do
  devise_for :users
  root to: "appointments#index"
  resources :appointments do
    resources :comments, only: :create
    resources :profiles, only: [:index, :new, :create]
  end
end
