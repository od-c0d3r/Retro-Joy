Rails.application.routes.draw do
  root   'application#main'
  
  resources :votes, only: [:create, :destory]
  resources :articles
  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
