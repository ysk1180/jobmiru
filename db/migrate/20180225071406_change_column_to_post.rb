class ChangeColumnToPost < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :job_content, :job_content1
    add_column :posts, :job_content2, :string
    add_column :posts, :job_content3, :string
    add_column :posts, :job_content4, :string
    add_column :posts, :job_content5, :string
    add_column :posts, :job_content6, :string
    add_column :posts, :job_ratio1, :integer
    add_column :posts, :job_ratio2, :integer
    add_column :posts, :job_ratio3, :integer
    add_column :posts, :job_ratio4, :integer
    add_column :posts, :job_ratio5, :integer
    add_column :posts, :job_ratio6, :integer
  end
end
