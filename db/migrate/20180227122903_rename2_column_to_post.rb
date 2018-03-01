class Rename2ColumnToPost < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :job_end1, :job_c1
    rename_column :posts, :job_end2, :job_c2
    rename_column :posts, :job_end3, :job_c3
    rename_column :posts, :job_end4, :job_c4
    rename_column :posts, :job_end5, :job_c5
    rename_column :posts, :job_end6, :job_c6
    rename_column :posts, :job_content1, :job_end1
    rename_column :posts, :job_content2, :job_end2
    rename_column :posts, :job_content3, :job_end3
    rename_column :posts, :job_content4, :job_end4
    rename_column :posts, :job_content5, :job_end5
    rename_column :posts, :job_content6, :job_end6
  end
end
