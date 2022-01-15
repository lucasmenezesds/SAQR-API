# frozen_string_literal: true

require_relative '../../lib/utils/auxiliary_functions'
require_relative '../../lib/statistical_libs/statistical_functions/exponential_functions'
require_relative '../../lib/statistical_libs/statistical_methods'
require_relative '../../lib/statistical_libs/kolmogorov_smirnov_steps'

# class containing the GOF Tests
class GoodnessOfFitTests
  attr_reader :distribution_name, :sample_to_process

  def initialize(sample_to_process = [], distribution_name = 'exponential')
    @sample_to_process   = sample_to_process
    @distribution_name   = distribution_name
    @kolmogorov          = KolmogorovSmirnovSteps.new
  end

  def kolmogorov_smirnov_test(sample_to_process = @sample_to_process, distribution_name = @distribution_name)
    empirical_cdf = StatisticalMethods.calculate_ecdf sample_to_process

    empirical_cdf_array = empirical_cdf['y_values'].sort
    puts "Distribution => #{distribution_name}"

    function_class_name = AuxiliaryFunctions.get_statistical_function_class distribution_name
    function_class = function_class_name.new

    theoretical_exponential_cdf = function_class.generate_theoretical_cdf sample_to_process
    theoretical_exponential_cdf = theoretical_exponential_cdf.sort

    @kolmogorov.calculate_d_value empirical_cdf_array, theoretical_exponential_cdf
  end

  # def anderson_darlin_test
  #   false
  # end
  #
  # def chi_square_test
  #   false
  # end
end
