class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :post_comment_replies, dependent: :destroy

  validates :content, presence: true

  scope :recent, -> (count = 100){ order('created_at asc').limit(count) }
end
