class AddEventPickingTime < ActiveRecord::Migration[5.1]
  def up
    add_column :picking_times, :event, :boolean, default: false
  end

  def down
    remove_column :picking_times, :event
  end
end
