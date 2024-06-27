Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :decks, except: :show
  resources :cards, except: :show

  resource :profile, only: :show
end
