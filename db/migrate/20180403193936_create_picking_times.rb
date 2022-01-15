class CreatePickingTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :picking_times do |t|
      t.integer :duration_time
      t.datetime :start_time
      t.integer :number_of_items
      t.integer :number_of_items_type
      t.datetime :picking_date

      t.timestamps
    end
  end
end
