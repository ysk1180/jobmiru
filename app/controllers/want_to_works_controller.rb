class WantToWorksController < ApplicationController
  def create
    want_to_work = current_user.want_to_works.create(post_id: params[:post_id])
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    want_to_work = current_user.want_to_works.find_by(post_id: params[:post_id]).destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
end
