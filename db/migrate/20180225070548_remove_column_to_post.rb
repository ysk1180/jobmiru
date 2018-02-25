class RemoveColumnToPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :experience_year, :integer
    remove_column :posts, :job_title, :string
    remove_column :posts, :job_category, :string
    remove_column :posts, :income, :integer
    remove_column :posts, :join_reason, :text
    remove_column :posts, :leave_reason, :text
  end
end
