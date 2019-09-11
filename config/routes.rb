Rails.application.routes.draw do
  devise_for :personals
  devise_for :accounts
  root to: 'home#index'
  resources :units, only: %i[ index show ] 
  resources :customers, only:%i[] do
    post 'add_unit', on: :member
  end
  resources :personals, only: %i[index new create edit]
  resources :profiles, only: %i[index new create show edit update]
  resources :units, only: %i[index show]
  resources :schedules, only:%i[new create edit update show]
  resources :appointments, only:%i[show]

  get '/my_schedule', to: 'schedules#my_schedule'
  resources :accounts, only:%i[show]
end
