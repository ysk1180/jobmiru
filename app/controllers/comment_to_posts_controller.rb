class CommentToPostsController < ApplicationController
  before_action :set_comment_to_post, only: [:show, :edit, :update, :destroy]

  # GET /comment_to_posts
  # GET /comment_to_posts.json
  def index
    @comment_to_posts = CommentToPost.all
  end

  # GET /comment_to_posts/1
  # GET /comment_to_posts/1.json
  def show
  end

  # GET /comment_to_posts/new
  def new
    @comment_to_post = CommentToPost.new
  end

  # GET /comment_to_posts/1/edit
  def edit
  end

  # POST /comment_to_posts
  # POST /comment_to_posts.json
  def create
    @comment_to_post = CommentToPost.new(comment_to_post_params)

    respond_to do |format|
      if @comment_to_post.save
        # コメント後のリダイレクト設定
        # redirect_to("/posts/#{params[:post_id]}")
        format.html { redirect_to("/posts/#{params[:post_id]}")}
        # format.json { render :show, status: :created, location: @comment_to_post }
      else
        format.html { render :new }
        format.json { render json: @comment_to_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_to_posts/1
  # PATCH/PUT /comment_to_posts/1.json
  def update
    respond_to do |format|
      if @comment_to_post.update(comment_to_post_params)
        format.html { redirect_to @comment_to_post, notice: 'Comment to post was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_to_post }
      else
        format.html { render :edit }
        format.json { render json: @comment_to_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_to_posts/1
  # DELETE /comment_to_posts/1.json
  def destroy
    @comment_to_post.destroy
    respond_to do |format|
      format.html { redirect_to("/posts/#{params[:post_id]}") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_to_post
      @comment_to_post = CommentToPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_to_post_params
      params.require(:comment_to_post).permit(:comment_to_post_content, :post_id, :user_id)
    end
end
