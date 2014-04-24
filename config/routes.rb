TicTacWithFriends::Application.routes.draw do
  root to: 'application#index'
  resources :application, only: [:index]
  devise_for :users

end
