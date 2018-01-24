class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    # ユーザーの投稿一覧で使用
    # @q = Post.ransack(params[:id])
    # @posts = @q.result.select(@user.id).order('created_at desc').page(params[:page])
    @posts = Post.all

  end
end
