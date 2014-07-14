class Keyword < ActiveRecord::Base
  has_many :movie_keywords
  has_many :titles, through: :movie_keywords
end
