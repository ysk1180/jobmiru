class LikeToPostsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like_to_post = current_user.like_to_posts.create(post_id: params[:post_id])
    @like_to_posts_count = LikeToPost.where(post_id: @post.id).count
    render :index
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like_to_post = current_user.like_to_posts.find_by(post_id: params[:post_id])
    @like_to_post.destroy
    @like_to_post = current_user.like_to_posts.find_by(post_id: params[:post_id])
    @like_to_posts_count = LikeToPost.where(post_id: @post.id).count
    render :index
  end
end
