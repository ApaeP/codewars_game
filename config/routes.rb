Rails.application.routes.draw do
  root                                  to: 'pages#home'

  devise_for :users

  resources :katas, only: [:show, :index]

  get   'pages/dashboard',              to: 'user_infos#dashboard', as: :dashboard

  patch 'katas/fetch',                  to: 'katas#fetch_katas', as: :fetch_katas
  post  'request_friendship/:user_id',  to: 'friendships#request_friendship', as: :request_friendship
  patch 'accept_friendship/:id',        to: 'friendships#accept_friendship', as: :accept_friendship
  patch 'reject_friendship/:id',        to: 'friendships#reject_friendship', as: :reject_friendship

  get   'leaderboard',                  to: 'leaderboard#leaderboard'

  patch 'users/api_update/:user_id',    to: 'user_infos#update', as: :api_update_user

  get   'user_infos/:id',               to: 'user_infos#show', as: :user_infos
end
