class Add4ColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :skill4, :string
    add_column :posts, :skill5, :string
    add_column :posts, :skill_level4, :integer
    add_column :posts, :skill_level5, :integer
  end
end
