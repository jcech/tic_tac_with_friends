TicTacWithFriends::Application.routes.draw do
  root to: 'application#index'
  devise_for :users
  resources :messages
  resources :application, only: [:index]
  resources :users, only: [:edit, :show]

  resources :games, only: [:new, :create, :show]

match('game/:game_id/:space_number', {:via => :post, :to => 'make_moves#create'})




end
