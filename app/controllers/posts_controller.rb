class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @latest_posts = @user.latest_posts
    @posts = Post.find(params[:user_id])
    @latest_comments = @posts.recent_comments
  end

  def show
    # @post = Post.find(params[:id])
  end
end
