class RenameNameToPerson < ActiveRecord::Migration
  def change
    rename_table :name, :person
  end
end
