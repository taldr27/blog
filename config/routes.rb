Rails.application.routes.draw do
  get '/users/:user_id/posts', to: 'posts#index', as: 'post_path'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'post_show'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create', as: 'comment_create'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'like_create'
  
  resources :users, only: [:index, :show]

  resources :posts, only: [:new, :create]
end
