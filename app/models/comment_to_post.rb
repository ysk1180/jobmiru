class CommentToPost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :reply_to_comments, dependent: :destroy

  validates :comment_to_post_content, presence: true
end
