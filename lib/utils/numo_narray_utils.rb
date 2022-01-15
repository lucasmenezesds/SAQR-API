# frozen_string_literal: true

require 'numo/narray'

# Utils class for Numo::NArray
module NumoNarrayUtils
  def self.convert_array_to_narray(received_array)
    raise StandardError, 'Its seems like its not an array!' if received_array.class != Array

    Numo::DFloat.cast(received_array)
  rescue StandardError => e
    raise "Check the array condition: #{e}"
  end

  def self.get_numo_array_data(received_array)
    narray = convert_array_to_narray received_array
    min = narray.min
    max = narray.max
    size = narray.size
    std_dev = narray.stddev
    mean = narray.mean
    variance = narray.var

    { mean: mean, std_dev: std_dev, data_size: size, max_value: max, min_value: min, variance: variance }
  end
end
