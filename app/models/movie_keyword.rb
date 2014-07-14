class MovieKeyword < ActiveRecord::Base
  belongs_to :title, foreign_key: :movie_id
  belongs_to :keyword
end
