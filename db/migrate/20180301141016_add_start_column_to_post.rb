class AddStartColumnToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :job_start, :integer
  end
end
