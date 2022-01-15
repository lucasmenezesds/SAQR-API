class CreateLoadTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :load_times do |t|
      t.integer :duration_time
      t.boolean :event
      t.datetime :load_date

      t.timestamps
    end
  end
end
