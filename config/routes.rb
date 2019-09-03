Rails.application.routes.draw do
  devise_for :accounts
  root 'home#index'

  resources :personals, only: %i[new create]
end
