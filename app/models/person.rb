class Person < ActiveRecord::Base
  has_many :cast_infos
  has_many :titles, through: :cast_infos
  has_many :infos, class_name: 'PersonInfo'
end
