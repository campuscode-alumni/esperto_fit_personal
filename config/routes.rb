Rails.application.routes.draw do
  devise_for :personals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "personal#index"
end
