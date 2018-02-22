class WantsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @want = current_user.wants.create(post_id: params[:post_id])
    wants_count
    render :index
  end

  def destroy
    set_want
    @want.destroy
    @want = nil
    wants_count
    render :index
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_want
      @want = current_user.wants.find_by(post_id: params[:post_id])
    end

    def wants_count
      @wants_count = Want.where(post_id: @post.id).count
    end
end
