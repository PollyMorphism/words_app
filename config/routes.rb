Rails.application.routes.draw do
  resources :tasks, except: :show
  devise_for :users

  root "home#index"
end
