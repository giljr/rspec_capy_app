Rails.application.routes.draw do
  resources :posts
  devise_for :users

  get "up", to: "rails/health#show", as: :rails_health_check

  root "posts#index"  # optional
end