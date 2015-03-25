class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update, :show, :destroy]
  
  def index
  	@post=Post.all
  end

  def new
  	if user_signed_in?
  		@post=Post.new
  	else
  		flash[:notice]="Please sign in first."
  		redirect_to user_session_path
  	end
  end

  def create
  	@post=Post.create(post_params)
  	redirect_to @post, notice: "New post created."
  end

  def update
  	@post.update(post_params)
  	redirect_to @post, notice: "Post successfully updated."
  end

  def destroy
  	@post.destroy
  	redirect_to posts_index_path, notice: "Post deleted."
  end

  def edit
  end

  def show
  	@comment=Comment.new(:post=>@post)
  end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end
  
end
