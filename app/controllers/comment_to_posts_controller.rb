class CommentToPostsController < ApplicationController

  def new
    @comment_to_post = CommentToPost.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment_to_post = @post.comment_to_posts.build(comment_to_post_params)
    @comment_to_post.user_id = current_user.id

    @reply_to_comments = @post.reply_to_comments.includes(:user).all
    @reply_to_comment = @post.reply_to_comments.build(user_id: current_user.id) if current_user

    if @comment_to_post.save
      render :index
    end
  end

  def destroy
    @comment_to_post = CommentToPost.find(params[:id])

    @post = Post.find(params[:post_id])
    @reply_to_comments = @post.reply_to_comments.includes(:user).all
    @reply_to_comment = @post.reply_to_comments.build(user_id: current_user.id) if current_user

    if @comment_to_post.destroy
      render :index
    end
  end

  private
    def comment_to_post_params
      params.require(:comment_to_post).permit(:comment_to_post_content, :post_id, :user_id)
    end
end
