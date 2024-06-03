Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :tasks, except: :show
  resources :commits, only: :create
  resource :profile, only: :show
end
