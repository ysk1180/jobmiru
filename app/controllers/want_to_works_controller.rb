class WantToWorksController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @want_to_work = current_user.want_to_works.create(post_id: params[:post_id])
    @want_to_works_count = WantToWork.where(post_id: @post.id).count
    render :index
  end

  def destroy
    @post = Post.find(params[:post_id])
    @want_to_work = current_user.want_to_works.find_by(post_id: params[:post_id])
    @want_to_work.destroy
    @want_to_work = current_user.want_to_works.find_by(post_id: params[:post_id])
    @want_to_works_count = WantToWork.where(post_id: @post.id).count
    render :index
  end
end
