class RemoveColumnToPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :reward, :text
    remove_column :posts, :challenge, :text
  end
end
