class Person < ActiveRecord::Base
  has_many :cast_infos
  has_many :titles, through: :cast_infos
end
