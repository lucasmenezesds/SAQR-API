class CreateReceiveTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :receive_times do |t|
      t.integer :duration_time
      t.boolean :event
      t.datetime :received_date

      t.timestamps
    end
  end
end
