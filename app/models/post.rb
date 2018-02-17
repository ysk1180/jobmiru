class Post < ApplicationRecord
  validates :job_content, presence: true
  validates :obtained_skill, presence: true

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  has_many :wants, dependent: :destroy
  has_many :want_users, through: :wants, source: :user

  belongs_to :user
  has_many :comment_to_posts, dependent: :destroy

  has_many :reply_to_comments, dependent: :destroy
end
