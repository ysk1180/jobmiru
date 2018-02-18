class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.order('created_at desc').page(params[:page]).per(10).limit(100)
    @like_ranking = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @want_ranking = Post.find(Want.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def show
    @like = current_user.likes.find_by(post_id: @post.id) if user_signed_in?
    @likes_count = Like.where(post_id: @post.id).count
    @want = current_user.wants.find_by(post_id: @post.id) if user_signed_in?
    @wants_count = Want.where(post_id: @post.id).count
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.limit(100)
    @post_comment_replies = @post.post_comment_replies.includes(:user).limit(100)
    @post_comment_reply = @post.post_comment_replies.build(user_id: current_user.id) if current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: '投稿しました。投稿ありがとうございます。'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '投稿を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: '投稿を削除しました。'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:id, :industry, :company_name, :division_name, :experience_year, :job_title, :job_category, :income, :job_content, :obtained_skill, :reward, :challenge, :join_reason, :leave_reason, :user_id)
    end
end
