class AddColumnToPost2 < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :skill1, :string
    add_column :posts, :skill2, :string
    add_column :posts, :skill3, :string
    add_column :posts, :skill4, :string
    add_column :posts, :skill5, :string
    add_column :posts, :skill_level1, :integer
    add_column :posts, :skill_level2, :integer
    add_column :posts, :skill_level3, :integer
    add_column :posts, :skill_level4, :integer
    add_column :posts, :skill_level5, :integer
  end
end
