class Rename3ColumnToPost < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :job_c1, :job_content1
    rename_column :posts, :job_c2, :job_content2
    rename_column :posts, :job_c3, :job_content3
    rename_column :posts, :job_c4, :job_content4
    rename_column :posts, :job_c5, :job_content5
    rename_column :posts, :job_c6, :job_content6
  end
end
