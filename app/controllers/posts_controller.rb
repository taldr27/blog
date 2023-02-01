class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @latest_posts = @user.latest_posts
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
