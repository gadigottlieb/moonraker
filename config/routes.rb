Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :games
  resources :seasons
  post 'add_players_to_season', to: 'seasons#add_players_to_season'
  resources :players
end
