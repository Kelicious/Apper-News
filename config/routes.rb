Hnclone::Application.routes.draw do
  root to: 'stories#index'

  resources :users
  resource :sessions, only: [:create, :new, :destroy]
  resources :stories do
    member do
      resources :comments, only: [:new]
    end
  end
  resources :comments, except: [:new] do
    member do
      get 'reply'
    end
  end

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  match '/stories/:id/upvote', to: 'upvotes#create'
  match '/stories/:id/downvote', to: 'upvotes#destroy'
end
