class WantsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @want = current_user.wants.create(post_id: params[:post_id])
    @wants_count = Want.where(post_id: @post.id).count
    render :index
  end

  def destroy
    @post = Post.find(params[:post_id])
    @want = current_user.wants.find_by(post_id: params[:post_id])
    @want.destroy
    @want = current_user.wants.find_by(post_id: params[:post_id])
    @wants_count = Want.where(post_id: @post.id).count
    render :index
  end
end
