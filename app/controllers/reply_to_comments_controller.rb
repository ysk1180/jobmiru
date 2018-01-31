class ReplyToCommentsController < ApplicationController
  before_action :set_reply_to_comment, only: [:show, :destroy]

  def index
    @reply_to_comments = ReplyToComment.all
  end

  def show
  end

  def new
    @reply_to_comment = ReplyToComment.new
  end

  def create
    @reply_to_comment = ReplyToComment.new(reply_to_comment_params)
    if @reply_to_comment.save
      # comment controllerと同様にリダイレクト設定
      post = Post.find(params.require(:reply_to_comment).permit(:post_id)[:post_id])
      redirect_to post_path(post)
    end
  end

  def destroy
    @reply_to_comment.destroy
    # destroyもcreateと同様にcommentと同様の形
    redirect_to("/posts/#{@reply_to_comment.post_id}")
  end

  private
    def set_reply_to_comment
      @reply_to_comment = ReplyToComment.find(params[:id])
    end

    def reply_to_comment_params
      params.require(:reply_to_comment).permit(:reply_to_comment_content, :post_id, :user_id, :comment_to_post_id)
    end
end
