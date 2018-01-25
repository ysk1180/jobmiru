class AddParentIdToCommentToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :comment_to_posts, :parent_id, :integer
  end
end
