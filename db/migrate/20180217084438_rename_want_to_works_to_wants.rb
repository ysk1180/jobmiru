class RenameWantToWorksToWants < ActiveRecord::Migration[5.1]
  def change
    rename_table :want_to_works, :wants
  end
end
