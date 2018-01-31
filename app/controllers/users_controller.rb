class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.all
  end
end
