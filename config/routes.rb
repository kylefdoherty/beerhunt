Rails.application.routes.draw do
  resources :test_models
  root 'beers#index'

  resources :beers, only: [:index, :new, :create]


end
