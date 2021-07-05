Rails.application.routes.draw do
  get 'articles/new'
  get 'articles/create'
  get 'articles/edit'
  get 'articles/update'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  root 'application#index'

end
