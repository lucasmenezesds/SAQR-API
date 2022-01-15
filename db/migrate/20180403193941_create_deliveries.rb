class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.references :picking_time, foreign_key: true
      t.references :load_time, foreign_key: true
      t.references :transportation_time, foreign_key: true
      t.references :receive_time, foreign_key: true
      t.references :storage_time, foreign_key: true
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
