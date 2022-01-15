class AddCreateCitiesDistCollIndexes < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE INDEX cities_dist_coll_origin_id ON cities_distances_collections ((json_data->>'origin_id'))
    SQL

    execute <<-SQL
      CREATE INDEX cities_dist_coll_origin_name ON cities_distances_collections ((json_data->>'origin_name'))
    SQL

    execute <<-SQL
      CREATE INDEX cities_dist_coll_destination_id ON cities_distances_collections ((json_data->>'destination_id'))
    SQL

    execute <<-SQL
      CREATE INDEX cities_dist_coll_destination_name ON cities_distances_collections ((json_data->>'destination_name'))
    SQL

    execute <<-SQL
      CREATE INDEX cities_dist_coll_distance_value ON cities_distances_collections ((json_data->>'distance_value'))
    SQL
  end

  def down
    execute <<-SQL
      DROP INDEX cities_dist_coll_origin_id
    SQL

    execute <<-SQL
      DROP INDEX cities_dist_coll_origin_name
    SQL

    execute <<-SQL
      DROP INDEX cities_dist_coll_destination_id
    SQL

    execute <<-SQL
      DROP INDEX cities_dist_coll_destination_name
    SQL

    execute <<-SQL
      DROP INDEX cities_dist_coll_distance_value
    SQL
  end
end
