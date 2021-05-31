Rails.application.routes.draw do
  root  to: 'pages#home'
  devise_for :users
  get   'pages/home'

  get   'pages/dashboard',            to: 'user_infos#dashboard', as: :dashboard

  resources :katas, only: [:show, :index]
  patch 'katas/fetch',                to: 'katas#fetch_katas', as: :fetch_katas
  patch 'katas/build_kata/:id',       to: 'katas#build_kata', as: :build_kata
  patch 'katas/build_katas',          to: 'katas#build_katas', as: :build_katas

  patch 'solutions/build_solutions',  to: 'solutions#build_solutions', as: :build_solutions

  get   '/leaderboard',               to: 'leaderboard#leaderboard'

  patch 'users/api_update/:user_id',  to: 'user_infos#update', as: :api_update_user

  post '/lol',                        to: 'user_infos#lol'
end
