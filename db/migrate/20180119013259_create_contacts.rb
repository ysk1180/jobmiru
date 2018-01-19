class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :contact_name
      t.string :contact_email
      t.text :contact_content

      t.timestamps
    end
  end
end
