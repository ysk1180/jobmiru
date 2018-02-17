class PostCommentReply < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :post_comment

  validates :content, presence: true
end
