class CreateCommentToPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_to_posts do |t|
      t.text :comment_to_post_content
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
