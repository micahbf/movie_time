class IndexTitleInfoOnInfoType < ActiveRecord::Migration
  def change
    add_index :title_info, :info_type_id
  end
end
