# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :plans do
    member do
      get 'subscribe_plan'
      get 'unsubscribe_plan'
      get 'add_features'
    end
    resources :checkout, only: [:create]
  end
  get '/callback', to: 'sessions#create'
  get '/fetch_code', to: 'clients#login_marketforms'

  resources :additional_features, only: [:update]

  resources :features
  root to: 'users#index'

  namespace :api do
    namespace :v1 do
      resources :plans
      resources :subscriptions
    end
  end
end
