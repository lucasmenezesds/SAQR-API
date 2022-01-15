class AddTotalDurationToDelivery < ActiveRecord::Migration[5.1]
  def change
    add_column :deliveries, :total_duration, :integer
  end
end
