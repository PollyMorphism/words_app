Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :tasks, except: :show
  resources :rewards, except: :show
  resource :profile, only: :show
  resources :commits, only: :create
  resources :prizes, only: :create
end
