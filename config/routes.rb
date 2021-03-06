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
  
  resources :users, only: [:edit, :update, :show] do
    get 'followings', to: 'relationships#followings', as: 'followings'
    get 'followers', to: 'relationships#followers', as: 'followers'
    member do
      get :favorites
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
end