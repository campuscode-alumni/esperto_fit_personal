Rails.application.routes.draw do
  devise_for :personals
  devise_for :accounts
  root to: 'home#index'
  resources :units, only: %i[ index show ] 
  resources :customers, only:%i[] do
    post 'add_unit', on: :member
  end
  resources :personals, only: %i[index new create edit]
  resources :profiles, only: %i[index new create show]
  resources :schedules, only:%i[new create edit update show]
end
