Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/dashboard'
  devise_for :users
  root to: 'pages#home'
end
