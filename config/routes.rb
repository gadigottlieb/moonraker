Rails.application.routes.draw do
  root to: 'visitors#team_info'
  get '/all_users', to: 'visitors#all_users'
  devise_for :users
  resources :users
  resources :seasons do
    resources :games, except: [:index]
  end
  post 'add_players_to_season', to: 'seasons#add_players_to_season'
  resources :players
end
