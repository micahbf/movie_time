class Title < ActiveRecord::Base
  has_many :persons, through: :cast_infos
  has_many :cast_infos,
    -> { order 'nr_order ASC' },
    foreign_key: :movie_id
  has_many :movie_keywords, foreign_key: :movie_id
  has_many :keywords, through: :movie_keywords

  # For each of the roles in CastInfo, we define a scoped method here
  # so we have title.directors, title.actors, etc.
  CastInfo.roles.keys.each do |role|
    define_method(role.pluralize) {
      persons.merge(CastInfo.send(role))
    }
  end

  # as above, but not gender-specific
  def all_actors
    role_ids = CastInfo.roles.values_at('actor', 'actress')
    persons.where('cast_info.role IN (?)', role_ids)
  end
end
