class MovieKeywordToTitleKeyword < ActiveRecord::Migration
  def change
    rename_table :movie_keyword, :title_keyword
  end
end
