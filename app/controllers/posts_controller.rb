class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(10).recent
    @like_ranking = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @want_ranking = Post.find(Want.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def show
    @like = current_user.likes.find_by(post_id: @post.id) if user_signed_in?
    @likes_count = Like.where(post_id: @post.id).count
    @want = current_user.wants.find_by(post_id: @post.id) if user_signed_in?
    @wants_count = Want.where(post_id: @post.id).count
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.recent
    @post_comment_replies = @post.post_comment_replies.includes(:user).recent
    @post_comment_reply = @post.post_comment_replies.build(user_id: current_user.id) if current_user
    if @post.job_content6.present?
      @data = [ { name: "#{@post.job_content1}", data: [["", @post.job_end1]] }, { name: "#{@post.job_content2}", data: [["", @post.job_end2 - @post.job_end1]] }, { name: "#{@post.job_content3}", data: [["", @post.job_end3 - @post.job_end2]] }, { name: "#{@post.job_content4}", data: [["", @post.job_end4 - @post.job_end3]] }, { name: "#{@post.job_content5}", data: [["", @post.job_end5 - @post.job_end4]] }, { name: "#{@post.job_content6}", data: [["", @post.job_end6 - @post.job_end5]] } ]
    elsif @post.job_content5.present?
      @data = [ { name: "#{@post.job_content1}", data: [["", @post.job_end1]] }, { name: "#{@post.job_content2}", data: [["", @post.job_end2 - @post.job_end1]] }, { name: "#{@post.job_content3}", data: [["", @post.job_end3 - @post.job_end2]] }, { name: "#{@post.job_content4}", data: [["", @post.job_end4 - @post.job_end3]] }, { name: "#{@post.job_content5}", data: [["", @post.job_end5 - @post.job_end4]] } ]
    elsif @post.job_content4.present?
      @data = [ { name: "#{@post.job_content1}", data: [["", @post.job_end1]] }, { name: "#{@post.job_content2}", data: [["", @post.job_end2 - @post.job_end1]] }, { name: "#{@post.job_content3}", data: [["", @post.job_end3 - @post.job_end2]] }, { name: "#{@post.job_content4}", data: [["", @post.job_end4 - @post.job_end3]] } ]
    elsif @post.job_content3.present?
      @data = [ { name: "#{@post.job_content1}", data: [["", @post.job_end1]] }, { name: "#{@post.job_content2}", data: [["", @post.job_end2 - @post.job_end1]] }, { name: "#{@post.job_content3}", data: [["", @post.job_end3 - @post.job_end2]] } ]
    elsif @post.job_content2.present?
      @data = [ { name: "#{@post.job_content1}", data: [["", @post.job_end1]] }, { name: "#{@post.job_content2}", data: [["", @post.job_end2 - @post.job_end1]] } ]
    else
      @data = [ { name: "#{@post.job_content1}", data: [["", @post.job_end1]] } ]
    end
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
    params.require(:post).permit(:id, :industry, :company_name, :division_name, :job_category, :job_start, :job_content1, :job_end1, :job_content2, :job_end2, :job_content3, :job_end3, :job_content4, :job_end4, :job_content5, :job_end5, :job_content6, :job_end6, :skill1, :skill2, :skill3, :skill_level1, :skill_level2, :skill_level3, :obtained_skill, :user_id)
  end

  def correct_user
    @user = User.find(Post.find(params[:id]).user_id)
    @current_user = current_user
    redirect_to posts_path, notice: '他のユーザーの投稿は編集できません。' unless view_context.current_user?(@user, @current_user)
  end
end
