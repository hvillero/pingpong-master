Rails.application.routes.draw do
  devise_for :users
  resources :games, only: [:index, :new, :create]
  resources :leaderboard, only: [:index]

  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'

  root to: "leaderboard#index"
end
