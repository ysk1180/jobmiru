class ReplyToComment < ApplicationRecord
  # 投稿のコメントへの返信機能のためのアソシエーション
  belongs_to :user
  belongs_to :post
  belongs_to :comment_to_post
end
