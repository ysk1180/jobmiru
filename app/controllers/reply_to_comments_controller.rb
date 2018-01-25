class ReplyToCommentsController < ApplicationController
  before_action :set_reply_to_comment, only: [:show, :edit, :update, :destroy]

  # GET /reply_to_comments
  # GET /reply_to_comments.json
  def index
    @reply_to_comments = ReplyToComment.all
  end

  # GET /reply_to_comments/1
  # GET /reply_to_comments/1.json
  def show
  end

  # GET /reply_to_comments/new
  def new
    @reply_to_comment = ReplyToComment.new
  end

  # GET /reply_to_comments/1/edit
  def edit
  end

  # POST /reply_to_comments
  # POST /reply_to_comments.json
  def create
    @reply_to_comment = ReplyToComment.new(reply_to_comment_params)

    # respond_to do |format|
      if @reply_to_comment.save
        # format.html { redirect_to @reply_to_comment, notice: 'Reply to comment was successfully created.' }
        # format.json { render :show, status: :created, location: @reply_to_comment }

        # comment controllerと同様にリダイレクト設定
        post = Post.find(params.require(:reply_to_comment).permit(:post_id)[:post_id])
        redirect_to post_path(post)
      else
        # format.html { render :new }
        # format.json { render json: @reply_to_comment.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /reply_to_comments/1
  # PATCH/PUT /reply_to_comments/1.json
  def update
    respond_to do |format|
      if @reply_to_comment.update(reply_to_comment_params)
        format.html { redirect_to @reply_to_comment, notice: 'Reply to comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply_to_comment }
      else
        format.html { render :edit }
        format.json { render json: @reply_to_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reply_to_comments/1
  # DELETE /reply_to_comments/1.json
  def destroy
    @reply_to_comment.destroy
    # respond_to do |format|
    #   format.html { redirect_to reply_to_comments_url, notice: 'Reply to comment was successfully destroyed.' }
    #   format.json { head :no_content }
    # end

    # destroyもcreateと同様にcommentと同様の形
    redirect_to("/posts/#{@reply_to_comment.post_id}")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply_to_comment
      @reply_to_comment = ReplyToComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_to_comment_params
      params.require(:reply_to_comment).permit(:reply_to_comment_content, :post_id, :user_id, :comment_to_post_id)
    end
end
