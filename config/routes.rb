Rails.application.routes.draw do
  devise_for :personals
  devise_for :accounts

  resources :schedules, only:%i[new create edit update show]
  root to: 'home#index'
end
