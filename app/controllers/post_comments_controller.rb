class PostCommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def new
    @post_comment = PostComment.new
  end

  def create
    @post_comment = @post.post_comments.build(post_comment_params)
    @post_comment.user_id = current_user.id
    set_replies
    @post_comment_reply = @post.post_comment_replies.build(user_id: current_user.id)
    if @post_comment.save
      render :index
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    set_replies
    @post_comment_reply = @post.post_comment_replies.build(user_id: current_user.id)
    if @post_comment.destroy
      render :index
    end
  end

private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def post_comment_params
      params.require(:post_comment).permit(:content, :post_id, :user_id)
    end

    def set_replies
      @post_comment_replies = @post.post_comment_replies.includes(:user).all
    end
end
