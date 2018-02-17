class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.create(post_id: params[:post_id])
    @likes_count = Like.where(post_id: @post.id).count
    render :index
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post_id: params[:post_id])
    @like.destroy
    @like = current_user.likes.find_by(post_id: params[:post_id])
    @likes_count = Like.where(post_id: @post.id).count
    render :index
  end
end
