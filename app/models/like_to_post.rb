class LikeToPost < ApplicationRecord
  # 投稿へのいいね機能のアソシエーション
  belongs_to :user
  belongs_to :post
end
