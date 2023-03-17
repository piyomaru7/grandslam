class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post.id)
    else
      @post = @comment.post
      @comments = @post.comments.includes(:user)
      render "posts/show"
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(:user)
    Comment.find_by(id: params[:id],post_id: params[:post_id]).destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
