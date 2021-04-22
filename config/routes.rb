Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'

  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update, :show]
  resources :relationships, only: [:create, :destroy]
end