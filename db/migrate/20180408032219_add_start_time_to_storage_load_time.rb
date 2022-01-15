class AddStartTimeToStorageLoadTime < ActiveRecord::Migration[5.1]
  def change
    add_column :storage_times, :start_time, :datetime
    add_column :load_times, :start_time, :datetime
    add_column :receive_times, :start_time, :datetime
    add_column :transportation_times, :start_time, :datetime
  end
end
