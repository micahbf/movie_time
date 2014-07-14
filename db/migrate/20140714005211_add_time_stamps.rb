class AddTimeStamps < ActiveRecord::Migration
  def change
    tables = ActiveRecord::Base.connection.tables - ['schema_migrations']
    tables.each do |table|
      add_column table, :created_at, :datetime
      add_column table, :updated_at, :datetime
    end
  end
end
