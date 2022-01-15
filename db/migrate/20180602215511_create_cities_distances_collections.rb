class CreateCitiesDistancesCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :cities_distances_collections do |t|
      t.jsonb :json_data, null: false, default: '{}'

      t.timestamps
    end

    add_index :cities_distances_collections, :json_data, using: :gin
  end
end
