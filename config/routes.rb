Rails.application.routes.draw do
  devise_for :users
  root to: "appointments#index"
  resources :appointments do
    resources :comments, only: :create
    resources :profiles, only: [:index, :new, :create]
    collection do
      get 'search'
    end
  end
  get 'chats', to: 'chats#index'
  post 'chats', to: 'chats#create'
  get 'chats/:id', to: 'chats#checked'
end
