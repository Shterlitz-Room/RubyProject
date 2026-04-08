Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#about"

  get "catalog", to: "catalog#index", as: :catalog
  resources :products, only: [ :show ]

  get "register", to: "registrations#new", as: :register
  post "register", to: "registrations#create"
  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout
end
