class CreateDistributionMethodsParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :distribution_methods_parameters do |t|
      t.references :distribution_method, foreign_key: true
      t.references :distribution_parameter, foreign_key: true, index: {name: :index_distribution_methods_parameters_on_distribution_param_id}

      t.timestamps
    end
  end
end
