Rails.application.routes.draw do
  resources :test_models
  root "beers#index"

  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :beers
  resources :likes, only: [:create]
  delete "/unlike", to: "likes#destroy"
end
