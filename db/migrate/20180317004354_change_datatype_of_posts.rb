class ChangeDatatypeOfPosts < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :job_start, :float
    change_column :posts, :job_end1, :float
    change_column :posts, :job_end2, :float
    change_column :posts, :job_end3, :float
    change_column :posts, :job_end4, :float
    change_column :posts, :job_end5, :float
    change_column :posts, :job_end6, :float
  end
end
