class ChangeStartColumnToPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :job_start
  end
end
