Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'

  resources :posts, only: [:create, :edit, :update, :destroy]
end
