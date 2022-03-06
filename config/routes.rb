Rails.application.routes.draw do
  root "reports#index"

  devise_for :users

  get 'profile', to: 'users#show'

  resources :reports
end
