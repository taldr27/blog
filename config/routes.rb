Rails.application.routes.draw do
  get '/users/:user_id/posts', to: 'posts#index', as: 'post_path'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'post_show'
  
  resources :users, only: [:index, :show]
  resources :posts, only: [:new, :create]
end
