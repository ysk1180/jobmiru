class PostCommentReply < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :post_comment

  validates :content, presence: true

  scope :recent, -> (count = 100){ order('created_at asc').limit(count) }
end
