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
  validates :job_content2, presence: true, if: :job_end2_present?
  validates :job_end2, numericality: { greater_than: :job_end1 }, if: :job_content2_present?
  validates :job_content3, length: { maximum: 15 }
  validates :job_content3, presence: true, if: :job_end3_present?
  validates :job_end3, numericality: { greater_than: :job_end2 }, if: :job_content3_present?
  validates :job_content4, length: { maximum: 15 }
  validates :job_content4, presence: true, if: :job_end4_present?
  validates :job_end4, numericality: { greater_than: :job_end3 }, if: :job_content4_present?
  validates :job_content5, length: { maximum: 15 }
  validates :job_content5, presence: true, if: :job_end5_present?
  validates :job_end5, numericality: { greater_than: :job_end4 }, if: :job_content5_present?
  validates :job_content6, length: { maximum: 15 }
  validates :job_content6, presence: true, if: :job_end6_present?
  validates :job_end6, numericality: { greater_than: :job_end5 }, if: :job_content6_present?

  def job_end2_present?
    job_end2.present?
  end
  def job_content2_present?
    job_content2.present?
  end
  def job_end3_present?
    job_end3.present?
  end
  def job_content3_present?
    job_content3.present?
  end
  def job_end4_present?
    job_end4.present?
  end
  def job_content4_present?
    job_content4.present?
  end
  def job_end5_present?
    job_end5.present?
  end
  def job_content5_present?
    job_content5.present?
  end
  def job_end6_present?
    job_end6.present?
  end
  def job_content6_present?
    job_content6.present?
  end

  validates :skill1, presence: true
  validates :skill1, length: { maximum: 12 }
  validates :skill_level1, presence: true
  validates :skill2, presence: true
  validates :skill2, length: { maximum: 12 }
  validates :skill_level2, presence: true
  validates :skill3, presence: true
  validates :skill3, length: { maximum: 12 }
  validates :skill_level3, presence: true
  validates :skill4, length: { maximum: 12 }
  validates :skill4, presence: true, if: :skill_level4_present?
  validates :skill4, presence: true, if: :skill5_present?
  validates :skill_level4, presence: true, if: :skill4_present?
  validates :skill5, length: { maximum: 12 }
  validates :skill5, presence: true, if: :skill_level5_present?
  validates :skill_level5, presence: true, if: :skill5_present?

  def skill4_present?
    skill4.present?
  end
  def skill_level4_present?
    skill_level4.present?
  end
  def skill5_present?
    skill5.present?
  end
  def skill_level5_present?
    skill_level5.present?
  end

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
