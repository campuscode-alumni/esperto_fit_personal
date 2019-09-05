Rails.application.routes.draw do
  devise_for :personals
  devise_for :accounts
  root 'home#index'

  resources :personals, only: %i[index new create edit]
  resources :profiles, only: %i[index new create show]
  resources :units, only: %i[index show]

  resources :schedules, only:%i[new create edit update show]

  get '/my_schedule', to: 'schedules#my_schedule'
end
