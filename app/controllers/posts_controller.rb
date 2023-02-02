class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user
      if @post.save!
        flash.now[:notice] = 'Comment created successfully'
        redirect_to user_path(current_user)
      else
        redirect_to user_path(current_user)
      end
  end 

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.all
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
