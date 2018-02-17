class ChangeColumnToPostCommentReply < ActiveRecord::Migration[5.1]
  def change
    rename_column :post_comment_replies, :reply_to_comment_content, :content
    rename_column :post_comment_replies, :comment_to_post_id, :post_comment_id
  end
end
