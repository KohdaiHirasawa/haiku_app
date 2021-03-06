Rails.application.routes.draw do
  root 'microposts#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users
  resources :microposts
  resources :likes, only: [:create, :destroy]
end
