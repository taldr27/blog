class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @comments = Comment.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    flash.now[:notice] = 'Comment created successfully' if @post.save!
    redirect_to user_path(current_user.id)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.all
  end

  def destroy
    @post = Post.find(params[:id])
    @likes = Like.where(post_id: @post.id)
    @comments = Comment.where(post_id: @post.id)
    @likes.destroy_all
    @comments.destroy_all
    @post.destroy
    redirect_to post_path_path(current_user.id)
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
