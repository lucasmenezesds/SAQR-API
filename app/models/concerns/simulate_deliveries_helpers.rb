# frozen_string_literal: true

require_relative '../../../lib/statistical_libs/statistical_functions/random_numbers_generators'
require_relative '../../../lib/utils/numo_narray_utils'

# Helpers for the Simulate Deliveries endpoint
module SimulateDeliveriesHelpers
  def self.calculate_mean_of_arrays_per_position(array_of_arrays)
    arrays_size = array_of_arrays.first.size

    array_of_arrays.each do |current_array|
      raise StandardError 'The arrays have different sizes' if current_array.size != arrays_size
    end

    # Group the array's elements per position
    transposed_array = array_of_arrays.transpose

    mean_of_arrays = transposed_array.map do |elem|
      (elem.sum / elem.size)
    end

    mean_of_arrays
  end

  def self.calculate_mean_for_steps(number_of_simulations, number_of_samples, steps)
    final_arrays = []

    steps.each do |step|
      distribution_data = step[:distribution_method]
      distribution_name = distribution_data[:name]
      distribution_parameters = distribution_data[:parameters]
      parameters_to_rng = {}

      distribution_parameters.each do |param|
        parameters_to_rng[param[:name].to_sym] = param[:value]
      end

      steps_mean = []
      number_of_simulations.times do
        generated_samples = RandomNumbersGenerators.distribution_based_generation(number_of_samples, distribution_name, parameters_to_rng)

        sumup = generated_samples.sum * 1.0
        mean = sumup / number_of_samples.to_f
        steps_mean << mean
      end

      final_arrays << steps_mean
    end

    calculate_mean_of_arrays_per_position(final_arrays)
  end

  def self.simulations_statistical_data(simulated_data)
    narray_data = NumoNarrayUtils.get_numo_array_data simulated_data
    narray_data[:data] = simulated_data
    narray_data
  end
end
