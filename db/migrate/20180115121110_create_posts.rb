class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :industry
      t.string :company_name
      t.string :division_name
      t.integer :experience_year
      t.string :job_title
      t.string :job_category
      t.integer :income
      t.text :job_content
      t.text :obtained_skill
      t.text :reward
      t.text :challenge
      t.text :join_reason
      t.text :leave_reason
      t.integer :user_id

      t.timestamps
    end
  end
end
