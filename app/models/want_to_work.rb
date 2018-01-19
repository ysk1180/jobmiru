class WantToWork < ApplicationRecord
  # 投稿への働きたい機能のアソシエーション
  belongs_to :user
  belongs_to :post
end
