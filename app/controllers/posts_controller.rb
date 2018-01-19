class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # ログインしていないユーザはログイン画面に強制リダイレクトする
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    # いいね機能のために@like_to_postに値を入れる
    @like_to_post = current_user.like_to_posts.find_by(post_id: @post.id) if user_signed_in?
    # いいね数表示
    @post = Post.find_by(id: params[:id])
    @like_to_posts_count = LikeToPost.where(post_id: @post.id).count

    # 働きたい機能のために@like_to_postに値を入れる
    @want_to_work = current_user.want_to_works.find_by(post_id: @post.id) if user_signed_in?
    # 働きたい数表示
    @post = Post.find_by(id: params[:id])
    @want_to_works_count = WantToWork.where(post_id: @post.id).count

    # 投稿へのコメント機能
    @comment_to_posts = @post.comment_to_posts.includes(:user).all
    @comment_to_post = @post.comment_to_posts.build(user_id: current_user.id) if current_user
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    # ログインしているuserのIDを、postのuser_idカラムへ入れる
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.permit(:id, :industry, :company_name, :division_name, :experience_year, :job_title, :job_category, :income, :job_content, :obtained_skill, :reward, :challenge, :join_reason, :leave_reason, :user_id)
    end
end
