 class CreateSimulateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :simulate_deliveries do |t|
      t.string :label
      t.jsonb :simulation_data
      t.jsonb :steps

      t.timestamps
    end
  end
end