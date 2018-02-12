class ReplyToCommentsController < ApplicationController

  def new
    @reply_to_comment = ReplyToComment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @reply_to_comment = @post.reply_to_comments.build(reply_to_comment_params)
    @reply_to_comment.user_id = current_user.id
    @reply_to_comment.comment_to_post_id = params[:comment_to_post_id]
    @comment_to_post = CommentToPost.find(params[:comment_to_post_id])
    @reply_to_comments = @post.reply_to_comments.includes(:user).all
    if @reply_to_comment.save
      render :index
    end
  end

  def destroy
    @reply_to_comment = ReplyToComment.find(params[:id])
    @reply_to_comment.destroy
    @comment_to_post = CommentToPost.find(params[:comment_to_post_id])
    @post = Post.find(params[:post_id])
    @reply_to_comments = @post.reply_to_comments.includes(:user).all
    render :index
  end

  private
    def reply_to_comment_params
      params.require(:reply_to_comment).permit(:reply_to_comment_content, :post_id, :user_id, :comment_to_post_id)
    end
end
