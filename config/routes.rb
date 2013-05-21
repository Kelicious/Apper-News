Hnclone::Application.routes.draw do
  root to: 'stories#index'

  resources :users
  resource :sessions, only: [:create, :new, :destroy]
  resources :stories do
    resources :comments, only: [:new]
  end
  resources :comments, except: [:new] do
    get 'reply'
  end

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  match '/stories/:id/upvote', to: 'upvotes#create'
  match '/stories/:id/downvote', to: 'upvotes#destroy'
end
