class Remove2ColumnToPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :skill4, :string
    remove_column :posts, :skill5, :string
    remove_column :posts, :skill_level4, :integer
    remove_column :posts, :skill_level5, :integer
  end
end
