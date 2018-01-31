class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 50 }

  # 投稿へのいいね機能のためのアソシエーション
  has_many :like_to_posts, dependent: :destroy

  # 投稿への働きたい機能のためのアソシエーション
  has_many :want_to_works, dependent: :destroy

  # 投稿へのコメント機能のためのアソシエーション
  has_many :posts, dependent: :destroy
  has_many :comment_to_posts, dependent: :destroy

  # 投稿のコメントへの返信機能のためのアソシエーション
  has_many :reply_to_comments, dependent: :destroy

  # 画像アップロード設定
  mount_uploader :user_image, UserImageUploader
end
