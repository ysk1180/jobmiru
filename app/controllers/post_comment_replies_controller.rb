class PostCommentRepliesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :set_comment, only: [:create, :destroy]

  def new
    @post_comment_reply = PostCommentReply.new
  end

  def create
    @post_comment_reply = @post.post_comment_replies.build(post_comment_reply_params)
    @post_comment_reply.user_id = current_user.id
    @post_comment_reply.post_comment_id = params[:post_comment_id]
    set_replies
    if @post_comment_reply.save
      render :index
    end
  end

  def destroy
    @post_comment_reply = PostCommentReply.find(params[:id])
    @post_comment_reply.destroy
    set_replies
    render :index
  end

  private
    def post_comment_reply_params
      params.require(:post_comment_reply).permit(:content, :post_id, :user_id, :post_comment_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @post_comment = PostComment.find(params[:post_comment_id])
    end

    def set_replies
      @post_comment_replies = @post.post_comment_replies.includes(:user).all
    end
end
