TicTacWithFriends::Application.routes.draw do
  root to: 'application#index'
  devise_for :users
  resources :application, only: [:index]
  resources :users, only: [:edit, :show]


end
