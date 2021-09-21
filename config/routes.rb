Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/contact', to: 'pages#contact'

  resources :posts, only: [:create]
end
