class CommentToPost < ApplicationRecord
  # 投稿へのコメント機能のためのアソシエーション
  belongs_to :user
  belongs_to :post

  # 投稿のコメントへの返信機能のためのアソシエーション
  has_many :reply_to_comments, dependent: :destroy

  # バリデーション設定
  validates :comment_to_post_content, presence: true
end
