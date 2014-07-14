class PersonInfo < ActiveRecord::Base
  belongs_to :person
  belongs_to :info_type
end
