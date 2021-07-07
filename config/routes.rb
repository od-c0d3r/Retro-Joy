Rails.application.routes.draw do
  root   'application#main'
  
  post   'votes/create'
  delete 'votes/destroy'

  get    'articles/new'
  get    'articles/create'
  get    'articles/edit'
  get    'articles/update'

  get    'users/new'
  get    'users/create'
  get    'users/edit'
  get    'users/update'


  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
