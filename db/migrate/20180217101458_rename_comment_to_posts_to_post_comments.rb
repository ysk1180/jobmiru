class RenameCommentToPostsToPostComments < ActiveRecord::Migration[5.1]
  def change
    rename_table :comment_to_posts, :post_comments
  end
end
