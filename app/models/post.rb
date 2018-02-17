class Post < ApplicationRecord
  validates :job_content, presence: true
  validates :obtained_skill, presence: true

  has_many :like_to_posts, dependent: :destroy
  has_many :like_to_post_users, through: :like_to_posts, source: :user

  has_many :want_to_works, dependent: :destroy
  has_many :want_to_work_users, through: :want_to_works, source: :user

  belongs_to :user
  has_many :comment_to_posts, dependent: :destroy

  has_many :reply_to_comments, dependent: :destroy
end
