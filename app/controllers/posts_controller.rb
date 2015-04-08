class PostsController < ApplicationController
  respond_to :html, :json
  def index
  	@posts=Post.all
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
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "New post created."
    else 
      render :new, alert: "Sorry, something went wrong. Please try again."
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    respond_with @post
  end

  def destroy
  	@post.destroy
  	redirect_to posts_index_path, notice: "Post deleted."
  end

  def show
    @post = Post.find(params[:id])
  	@comment=Comment.new(:post=>@post)
  end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:title, :body, :story, :main_image).merge(user_id: current_user.id)
  end
  
end
