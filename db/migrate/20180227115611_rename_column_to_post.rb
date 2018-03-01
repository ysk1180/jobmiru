class RenameColumnToPost < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :job_ratio1, :job_content1
    rename_column :posts, :job_ratio2, :job_content2
    rename_column :posts, :job_ratio3, :job_content3
    rename_column :posts, :job_ratio4, :job_content4
    rename_column :posts, :job_ratio5, :job_content5
    rename_column :posts, :job_ratio6, :job_content6
  end
end
