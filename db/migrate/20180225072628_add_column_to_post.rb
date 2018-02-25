class AddColumnToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :job_category, :string
  end
end
