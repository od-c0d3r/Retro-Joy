Rails.application.routes.draw do
  get 'categories/show'
  root   'application#main'

  resources :users
  resources :articles
  resources :votes,    only: [:create, :destory]
  resources :category, only: [:show]
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
