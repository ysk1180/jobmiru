class Post < ApplicationRecord
  validates :job_content1, presence: true
  validates :obtained_skill, presence: true
  validates :company_name, presence: true
  validates :industry, presence: true
  validates :job_category, presence: true
  validates :job_start, presence: true
  validates :job_end1, presence: true
  validates :job_end1, numericality: { greater_than: :job_start }

  validates :skill1, presence: true
  validates :skill2, presence: true
  validates :skill3, presence: true
  validates :skill4, presence: true
  validates :skill5, presence: true
  validates :skill_level1, presence: true
  validates :skill_level2, presence: true
  validates :skill_level3, presence: true
  validates :skill_level4, presence: true
  validates :skill_level5, presence: true

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  has_many :wants, dependent: :destroy
  has_many :want_users, through: :wants, source: :user

  belongs_to :user
  has_many :post_comments, dependent: :destroy

  has_many :post_comment_replies, dependent: :destroy

  scope :recent, -> (count = 100){ order('created_at desc').limit(count) }
end
