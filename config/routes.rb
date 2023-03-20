Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :users, only: [:show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  resources :posts do
    resources :comments, only: [:create,:destroy]
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
