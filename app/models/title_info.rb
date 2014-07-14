class TitleInfo < ActiveRecord::Base
  belongs_to :title, foreign_key: :movie_id
  belongs_to :info_type
end
