class AddColumn2ToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string
  end
end
