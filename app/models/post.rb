class Post < ApplicationRecord
  validates :company_name, presence: true
  validates :industry, presence: true
  validates :job_category, presence: true
  validates :job_start, presence: true
  validates :job_content1, presence: true
  validates :job_content1, length: { maximum: 15 }
  validates :job_end1, presence: true
  validates :job_end1, numericality: { greater_than: :job_start }, allow_blank: true

  validates :job_content2, length: { maximum: 15 }
  validates :job_content3, length: { maximum: 15 }
  validates :job_content4, length: { maximum: 15 }
  validates :job_content5, length: { maximum: 15 }

  validates :skill1, presence: true
  validates :skill_level1, presence: true
  validates :skill2, presence: true
  validates :skill_level2, presence: true
  validates :skill3, presence: true
  validates :skill_level3, presence: true
  validates :skill4, presence: true
  validates :skill_level4, presence: true
  validates :skill5, presence: true
  validates :skill_level5, presence: true

  validates :skill1, length: { maximum: 10 }
  validates :skill2, length: { maximum: 10 }
  validates :skill3, length: { maximum: 10 }
  validates :skill4, length: { maximum: 10 }
  validates :skill5, length: { maximum: 10 }

  validates :obtained_skill, presence: true

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  has_many :wants, dependent: :destroy
  has_many :want_users, through: :wants, source: :user

  belongs_to :user
  has_many :post_comments, dependent: :destroy

  has_many :post_comment_replies, dependent: :destroy

  scope :recent, -> (count = 10){ order('created_at desc').limit(count) }
end
