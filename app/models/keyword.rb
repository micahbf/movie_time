class Keyword < ActiveRecord::Base
  has_many :title_keywords
  has_many :titles, through: :title_keywords
end
