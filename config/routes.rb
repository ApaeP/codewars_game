Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  get 'pages/home'
  get 'pages/dashboard'

  get 'katas/fetch', to: 'katas#fetch_katas', as: :fetch_katas
  patch 'katas/build_kata/:id', to: 'katas#build_kata', as: :build_kata
  patch 'katas/build_katas', to: 'katas#build_katas', as: :build_katas

  resources :katas, only: [:show, :index]
end
