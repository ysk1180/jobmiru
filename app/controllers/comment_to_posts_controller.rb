class CommentToPostsController < ApplicationController
  before_action :set_comment_to_post, only: [:show, :destroy]

  def index
    @comment_to_posts = CommentToPost.all
  end

  def show
  end

  def new
    @comment_to_post = CommentToPost.new
  end

  def create
    @comment_to_post = CommentToPost.new(comment_to_post_params)
    if @comment_to_post.save
        # コメント後のリダイレクト設定
        # ↓のURLを直接指定するリダイレクトでも、idを指定できているため、リダイレクト可能であるが、
        # パスが変わってしまった時（例えばもう一層できた時）修正する必要が出てしまう。
        # redirect_to("/posts/#{params.require(:comment_to_post).permit(:post_id)[:post_id]}")
        # 上記より、redirect_to (prefixを記載)(インスタンス)でも同じ効果があり、こちらの方が良い場合が多い
        post = Post.find(params.require(:comment_to_post).permit(:post_id)[:post_id])
        redirect_to post_path(post)
    end
  end

  def destroy
    @comment_to_post.destroy
    # createのところを参照/インスタンス作成の方法だとうまく取れなかったから直接指定
    redirect_to("/posts/#{@comment_to_post.post_id}")
  end

  private
    def set_comment_to_post
      @comment_to_post = CommentToPost.find(params[:id])
    end

    def comment_to_post_params
      params.require(:comment_to_post).permit(:comment_to_post_content, :post_id, :user_id, :parent_id)
    end
end
