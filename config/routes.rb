Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users
  resources :items
  get 'new', to: 'items#new'
    resources :comments, only: :create
end
