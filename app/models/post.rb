class Post < ApplicationRecord
  validates :job_content1, presence: true
  validates :obtained_skill, presence: true
  validates :company_name, presence: true

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  has_many :wants, dependent: :destroy
  has_many :want_users, through: :wants, source: :user

  belongs_to :user
  has_many :post_comments, dependent: :destroy

  has_many :post_comment_replies, dependent: :destroy

  scope :recent, -> (count = 100){ order('created_at desc').limit(count) }
end
