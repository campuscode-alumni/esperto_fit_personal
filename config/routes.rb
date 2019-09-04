Rails.application.routes.draw do
  devise_for :accounts
  root to: 'home#index'
  resources :units, only: %i[ index show ]
end
