Rails.application.routes.draw do
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

  root   'application#index'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
