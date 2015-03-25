class CommentsController < ApplicationController
	before_action :set_comment, only: [:edit, :update, :show, :destroy]

  def new
  	@comment=Comment.new
  end

  def create
  	@post=Post.find(params[:post_id])
  	@comment = @post.comments.create(comment_params)
  	@comment.user = current_user
  	if @comment.save
  		redirect_to @post
  	else
  		flash.now[:danger] = "error"
  	end
  end

  def edit
  	@comment = Comment.find(params[:id])
  	@post = @comment.post
  	@comment.user = current_user
  end

  def update
  	@post = Post.find(params[:post_id])
  	@comment.update(comment_params)
  	redirect_to post_path(@post), notice: "Comment updated"
  end

  def show
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@comment=@post.comments.find(params[:id])
  	@comment.destroy
  	redirect_to post_path(@post)
  end

  private

  def set_comment
  	@comment=Comment.find(params[:id])
  end

  def comment_params
  	params.require(:comment).permit(:user_id, :post_id, :body)
  end

end
