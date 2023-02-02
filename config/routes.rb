Rails.application.routes.draw do
  get '/users/:user_id/posts', to: 'posts#index', as: 'post_path'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'post_show'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create', as: 'comment_create'
  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'comment_new'
  
  resources :users, only: [:index, :show]

  resources :posts, only: [:new, :create]
end
