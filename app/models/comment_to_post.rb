class CommentToPost < ApplicationRecord
  # 投稿へのコメント機能のためのアソシエーション
  belongs_to :user
  belongs_to :post
end
