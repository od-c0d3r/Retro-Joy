Rails.application.routes.draw do
  get       'categories/show'
  root      'application#main'

  get       '/login',   to: 'sessions#new'
  post      '/login',   to: 'sessions#create'
  delete    '/logout',  to: 'sessions#destroy'

  get       '/signup',  to: 'users#new'

  resources :users,     only: %i[index create]
  resources :categories,  only: %i[show]
  resources :articles,  only: %i[new show create]
  resources :votes,     only: %i[create destory]

end
