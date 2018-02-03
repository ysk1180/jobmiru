class UsersController < ApplicationController
  # ログイン後のページ設定
  before_action :sign_in_required, only: [:show]

  def show
    # ログイン後、マイページに遷移させるために条件分岐追加
    if params[:format].present?
      @user = User.find(params[:format])
    else
      @user = User.find(params[:id])
    end
    @posts = Post.all
  end
end
