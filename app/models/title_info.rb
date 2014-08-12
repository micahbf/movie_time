class TitleInfo < ActiveRecord::Base
  belongs_to :title, foreign_key: :movie_id
  belongs_to :info_type

  # Scopes for every InfoType
  InfoType.pluck(:id, :info).each do |info_type_id, info_type_name|
    scope info_type_name.tr(' ', '_'),
      -> { where(info_type_id: info_type_id) }
  end
end
