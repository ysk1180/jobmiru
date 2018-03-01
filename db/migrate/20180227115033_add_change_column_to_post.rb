class AddChangeColumnToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :job_start, :string
    rename_column :posts, :job_content1, :job_end1
    rename_column :posts, :job_content2, :job_end2
    rename_column :posts, :job_content3, :job_end3
    rename_column :posts, :job_content4, :job_end4
    rename_column :posts, :job_content5, :job_end5
    rename_column :posts, :job_content6, :job_end6
end
end
