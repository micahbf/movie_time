class MoviesToTitles < ActiveRecord::Migration
  def change
    rename_table :movie_companies, :title_companies
    rename_table :movie_info, :title_info
    rename_table :movie_info_idx, :title_info_idx
    rename_table :movie_link, :title_link
  end
end
