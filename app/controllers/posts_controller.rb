class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(10).recent
    @count = @posts.total_count
    @like_ranking = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @want_ranking = Post.find(Want.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def like_ranking
    @posts = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(50).pluck(:post_id))
  end

  def want_ranking
    @posts = Post.find(Want.group(:post_id).order('count(post_id) desc').limit(50).pluck(:post_id))
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
    if @post.skill5.present?
      @skills = ["#{@post.skill1}", "#{@post.skill2}", "#{@post.skill3}", "#{@post.skill4}", "#{@post.skill5}"]
      @levels = [@post.skill_level1, @post.skill_level2, @post.skill_level3, @post.skill_level4, @post.skill_level5]
    elsif @post.skill4.present?
      @skills = ["#{@post.skill1}", "#{@post.skill2}", "#{@post.skill3}", "#{@post.skill4}"]
      @levels = [@post.skill_level1, @post.skill_level2, @post.skill_level3, @post.skill_level4]
    else
      @skills = ["#{@post.skill1}", "#{@post.skill2}", "#{@post.skill3}"]
      @levels = [@post.skill_level1, @post.skill_level2, @post.skill_level3]
    end
    @posts = Post.where(industry: @post.industry).where.not(id: @post.id).order("RANDOM()").limit(3)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    next_id = Post.last.id + 1
    make_picture(next_id)
    if @post.save
      redirect_to @post, notice: '投稿しました。投稿ありがとうございます。「Tweet」ボタンから投稿をシェアしてみましょう！'
    else
      render :new
    end
  end

  def update
    make_picture
    if @post.update(post_params)
      redirect_to @post, notice: '投稿を更新しました。「Tweet」ボタンから投稿をシェアしてみましょう！'
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
    params.require(:post).permit(:id, :industry, :company_name, :division_name, :job_category, :job_start, :job_content1, :job_end1, :job_content2, :job_end2, :job_content3, :job_end3, :job_content4, :job_end4, :job_content5, :job_end5, :job_content6, :job_end6, :skill1, :skill2, :skill3, :skill4, :skill5, :skill_level1, :skill_level2, :skill_level3, :skill_level4, :skill_level5, :obtained_skill, :user_id)
  end

  def correct_user
    @user = User.find(Post.find(params[:id]).user_id)
    @current_user = current_user
    redirect_to posts_path, notice: '他のユーザーの投稿は編集できません。' unless view_context.current_user?(@user, @current_user)
  end

  def make_picture(next_id)
    font = ".fonts/ipag.ttc"
    image = MiniMagick::Image.open("base.png")
    image.combine_options do |i|
      i.font font
      i.gravity 'center'
      i.pointsize 17
      if @post.skill5.present?
        i.draw "text 0,-5 '#{@post.skill1}\n#{@post.skill2}\n#{@post.skill3}\n#{@post.skill4}\n#{@post.skill5}\n\nのスキルが身についたのは何の仕事でしょうか？\nこちらからご覧ください！'"
      elsif @post.skill4.present?
        i.draw "text 0,-5 '#{@post.skill1}\n#{@post.skill2}\n#{@post.skill3}\n#{@post.skill4}\n\nのスキルが身についたのは何の仕事でしょうか？\nこちらからご覧ください！'"
      else
        i.draw "text 0,-5 '#{@post.skill1}\n#{@post.skill2}\n#{@post.skill3}\n\nのスキルが身についたのは何の仕事でしょうか？\nこちらからご覧ください！'"
      end
    end
    storage = Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    )
    case Rails.env
      when 'production'
        bucket = storage.directories.get('jobmiru-production')
        png_path = 'images/' + next_id.to_s + '.png'
        image_uri = image.path
        file = bucket.files.create(key: png_path, public: true, body: open(image_uri))
        @post.picture = 'https://s3-ap-northeast-1.amazonaws.com/jobmiru-production' + "/" + png_path
      when 'development'
        bucket = storage.directories.get('jobmiru-development')
        png_path = 'images/' + next_id.to_s + '.png'
        image_uri = image.path
        file = bucket.files.create(key: png_path, public: true, body: open(image_uri))
        @post.picture = 'https://s3-ap-northeast-1.amazonaws.com/jobmiru-development' + "/" + png_path
    end
  end
end
