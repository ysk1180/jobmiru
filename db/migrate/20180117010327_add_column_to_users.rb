# ユーザーテーブルにカラム追加
class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :age, :integer
    add_column :users, :sex, :string
    add_column :users, :past_career, :text
    add_column :users, :career_plan, :text
    add_column :users, :user_image, :string
  end
end
