Rails.application.routes.draw do
  root 'welcome#index'

  get '/about' => 'welcome#about'

  get '/help' => 'welcome#help'

  # get '/users/:id' => 'users#show', as: :user

  devise_for :users
  resources :users, only: [:show]

  put 'users/:id/posts/edit' => 'tutorials#update', as: :edit_post

  resources :posts, except: [:index, :edit] do
    resources :comments
  end

end
