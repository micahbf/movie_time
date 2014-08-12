class IndexGenreTitleInfosOnInfo < ActiveRecord::Migration
  def change
    add_index :title_info, :info, where: 'info_type_id = 3'
  end
end
