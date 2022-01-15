class CreateCargos < ActiveRecord::Migration[5.1]
  def change
    create_table :cargos do |t|
      t.references :truck, foreign_key: true
      t.references :delivery, foreign_key: true

      t.timestamps
    end
  end
end
