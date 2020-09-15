Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: :create
  resources :items  do
    resources :comments, only: :create
  end
end
