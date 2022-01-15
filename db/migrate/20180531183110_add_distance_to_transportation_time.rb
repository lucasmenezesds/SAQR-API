class AddDistanceToTransportationTime < ActiveRecord::Migration[5.1]
  def change
    add_column :transportation_times, :distance, :integer
  end
end
