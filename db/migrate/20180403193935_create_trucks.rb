class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
      t.references :driver, foreign_key: true
      t.string :model

      t.timestamps
    end
  end
end
