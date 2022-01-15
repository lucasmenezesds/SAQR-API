class CreateDistributionParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :distribution_parameters do |t|
      t.string :name
      t.string :symbol
      t.boolean :uppercase
      t.string :meaning

      t.timestamps
    end
  end
end
