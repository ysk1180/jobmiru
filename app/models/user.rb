class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # nameのバリデーション設定
  validates :name, presence: true, length: { maximum: 50 }

  # 投稿へのいいね機能のためのアソシエーション
  has_many :like_to_posts, dependent: :destroy

  # 投稿への働きたい機能のためのアソシエーション
  has_many :want_to_works, dependent: :destroy

  # 投稿へのコメント機能のためのアソシエーション
  has_many :posts
  has_many :comment_to_posts

  # 画像アップロード設定
  mount_uploader :user_image, UserImageUploader
end
