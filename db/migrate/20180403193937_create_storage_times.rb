class CreateStorageTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :storage_times do |t|
      t.integer :duration_time
      t.boolean :event
      t.datetime :storage_date

      t.timestamps
    end
  end
end
