Hnclone::Application.routes.draw do
  root to: 'users#new'

  resources :users
  resource :sessions, only: [:create, :new, :destroy]

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
end
