Rails.application.routes.draw do

  get 'labels/show'

  resources :topics do
    resources :posts, except: [:index]
    resources :comments, only: [:create, :destroy]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :labels, only: [:show]

  get 'about' => 'welcome#about'

  post 'users/confirm' => 'users#confirm'

  root 'welcome#index'

  get 'welcome/faq'
end
