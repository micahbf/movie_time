class CastInfo < ActiveRecord::Base
  belongs_to :person
  belongs_to :title, foreign_key: :movie_id
  enum role: { actor: 1, actress: 2, producer: 3, writer: 4,
               cinematographer: 5, composer: 6, costume_designer: 7,
               director: 8, editor: 9, misc_crew: 10,
               production_designer: 11, guest: 12
             }
end
