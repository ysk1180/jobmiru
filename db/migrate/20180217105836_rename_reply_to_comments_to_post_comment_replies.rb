class RenameReplyToCommentsToPostCommentReplies < ActiveRecord::Migration[5.1]
  def change
    rename_table :reply_to_comments, :post_comment_replies
  end
end
