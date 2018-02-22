class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    likes_count
    render :index
  end

  def destroy
    set_like
    @like.destroy
    @like = nil
    likes_count
    render :index
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_like
      @like = current_user.likes.find_by(post_id: params[:post_id])
    end

    def likes_count
      @likes_count = Like.where(post_id: @post.id).count
    end
end
