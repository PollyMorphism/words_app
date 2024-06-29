Rails.application.routes.draw do
  devise_for :users

  root "decks#index"

  resources :decks
  resources :cards, except: :show

  resource :profile, only: :show
end
