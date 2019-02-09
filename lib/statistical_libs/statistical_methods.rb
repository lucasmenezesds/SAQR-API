require_relative '../../lib/utils/numo_and_array_utils'

# Class that contains  all generic statistical methods
module StatisticalMethods

  # Empiric CDF based on received data array
  def self.calculate_ecdf(array_of_numbers)
    final_result          = {}
    raw_data              = array_of_numbers
    raw_data_size         = raw_data.size
    array_of_uniq_numbers = array_of_numbers.uniq

    min, max, size = get_numo_array_data array_of_uniq_numbers

    x_values                 = Numo::DFloat.linspace(min, max, size)
    final_result['x_values'] = x_values.to_a
    y_values                 = []

    x_values.each do |current_value|
      temp  = raw_data.select { |item| item <= current_value }
      value = temp.size / raw_data_size.to_f
      y_values.push(value)
    end
    final_result['y_values'] = y_values

    final_result
  end

  # Calculate the ln(x) for each element of the array
  def self.get_natural_logarithm_array(received_array)
    if received_array.class != Array || received_array.empty?
      throw('#get_natural_logarithm_array should not receive empty array of numbers')
    else
      received_array.map do |element|
        if element.is_a? Numeric
          Math.log(element, Math::E)
        end
      end
    end
  rescue StandardError => e
    "Something went wrong during the calculation, Error: #{e}"
  end
end