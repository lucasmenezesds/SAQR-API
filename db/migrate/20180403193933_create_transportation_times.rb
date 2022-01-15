class CreateTransportationTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :transportation_times do |t|
      t.integer :duration_time
      t.boolean :event
      t.datetime :transportation_date
      t.references :origin_city, foreign_key: {to_table: :cities}
      t.references :destination_city, foreign_key: {to_table: :cities}

      t.timestamps
    end
  end
end
