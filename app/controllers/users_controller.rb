class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def show
    if params[:format].present?
      @user = User.find(params[:format])
    else
      @user = User.find(params[:id])
    end
    @posts = @user.posts
    @want_posts = Post.find(Want.find(@user.wants.ids).pluck(:post_id))
  end
end
