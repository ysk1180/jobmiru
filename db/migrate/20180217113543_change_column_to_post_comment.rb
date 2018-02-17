class ChangeColumnToPostComment < ActiveRecord::Migration[5.1]
  def change
    rename_column :post_comments, :comment_to_post_content, :content
  end
end
