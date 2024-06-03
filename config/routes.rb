Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :tasks, except: :show
  resource :profile, only: :show
end
