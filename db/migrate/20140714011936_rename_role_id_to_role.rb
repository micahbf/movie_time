class RenameRoleIdToRole < ActiveRecord::Migration
  def change
    rename_column :cast_info, :role_id, :role
  end
end
