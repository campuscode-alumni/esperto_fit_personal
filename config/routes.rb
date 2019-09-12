Rails.application.routes.draw do
  devise_for :accounts
  resources :units, only: %i[ index show ] 
  resources :customers, only:%i[] do
    post 'add_unit', on: :member
  end
  resources :profiles, only: %i[index new create show edit update]
  resources :units, only: %i[index show]
  resources :personals, only: %i[index new create edit]
  resources :schedules, only:%i[new create edit update show]
  resources :appointments, only:%i[show]
  resources :accounts, only:%i[show]

  root to: 'home#index'
  get '/my_schedule', to: 'schedules#my_schedule'
  resources :accounts, only:%i[show]

  namespace 'api' do
    namespace 'v1' do
      get '/search/account', to: 'accounts#search'
      resources :customers, only: %i[show]
    end
  end
end
