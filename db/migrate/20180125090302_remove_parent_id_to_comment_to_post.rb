class RemoveParentIdToCommentToPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :comment_to_posts, :parent_id, :integer
  end
end
