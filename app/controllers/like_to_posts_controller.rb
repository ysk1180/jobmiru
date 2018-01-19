class LikeToPostsController < ApplicationController
  def create
    like_to_post = current_user.like_to_posts.create(post_id: params[:post_id])
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    like_to_post = current_user.like_to_posts.find_by(post_id: params[:post_id]).destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
end
