class Post < ApplicationRecord
  # 投稿へのいいね機能のためのアソシエーション
  has_many :like_to_posts, dependent: :destroy
  has_many :like_to_post_users, through: :like_to_posts, source: :user

  # 投稿へのいいね機能のためのアソシエーション
  has_many :want_to_works, dependent: :destroy
  has_many :want_to_work_users, through: :want_to_works, source: :user

  # 投稿へのコメント機能のためのアソシエーション
  belongs_to :user
  has_many :comment_to_posts, dependent: :destroy

  # 投稿のバリデーション設定
  validates :job_content, presence: true
  validates :obtained_skill, presence: true

  # 投稿のコメントへの返信機能のためのアソシエーション
  has_many :reply_to_comments, dependent: :destroy
end
