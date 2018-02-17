class RenameLikeToPostsToLikes < ActiveRecord::Migration[5.1]
  def change
    rename_table :like_to_posts, :likes
  end
end
