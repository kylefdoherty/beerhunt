Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :test_models
  root "beers#index"

  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :comments, only: [:destroy, :edit, :update]

  resources :beers do
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create]
  delete "/unlike", to: "likes#destroy"
end
