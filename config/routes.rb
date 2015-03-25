Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  resources :posts
  resources :users, only: [:show]

  resources :posts do
    resources :comments
  end

  get 'comments/new'

  get 'comments/edit'

  get 'comments/show'

  get 'posts/index'

  get 'posts/new'

  get 'posts/show'

  get 'welcome/index'

  root 'welcome#index'
end
