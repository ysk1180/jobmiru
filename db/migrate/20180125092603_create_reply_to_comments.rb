class CreateReplyToComments < ActiveRecord::Migration[5.1]
  def change
    create_table :reply_to_comments do |t|
      t.text :reply_to_comment_content
      t.integer :post_id
      t.integer :user_id
      t.integer :comment_to_post_id

      t.timestamps
    end
  end
end
