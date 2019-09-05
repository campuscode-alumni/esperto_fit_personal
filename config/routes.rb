Rails.application.routes.draw do
  devise_for :accounts
  root to: 'home#index'
  resources :units, only: %i[ index show ] 
  resources :customers, only:%i[] do
    post 'add_unit', on: :member
  end
end
