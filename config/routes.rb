Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'

  resources :tweets, only: [:index, :new, :create, :edit, :update, :show]
  resources :users, only: [:edit, :update, :show]
end