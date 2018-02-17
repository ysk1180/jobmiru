class ChangeColumnToContact < ActiveRecord::Migration[5.1]
  def change
    rename_column :contacts, :contact_name, :name
    rename_column :contacts, :contact_email, :email
    rename_column :contacts, :contact_content, :content
  end
end
