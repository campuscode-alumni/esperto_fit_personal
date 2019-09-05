Rails.application.routes.draw do
  devise_for :accounts
  root 'home#index'

  resources :personals, only: %i[index new create edit]
  resources :profiles, only: %i[index new create show]
  resources :units, only: %i[index show]
end
