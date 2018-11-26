require_relative '../../lib/statistical_libs/exponential_functions'
require_relative '../../lib/statistical_libs/statistical_methods'
require_relative '../../lib/statistical_libs/kolmogorov_smirnov_steps'

# class containing the GOF Tests
class GoodnessOfFitTests
  attr_reader :distribution_name, :sample_to_process

  def initialize(sample_to_process = [], distribution_name = 'exponential')
    @sample_to_process = sample_to_process
    @distribution_name = distribution_name
    @kolmogorov = KolmogorovSmirnovSteps.new
    @statistical_methods = StatisticalMethods.new
  end

  def kolmogorov_smirnov_test(sample_to_process = @sample_to_process, distribution_name = @distribution_name)

    empirical_cdf = @statistical_methods.calculate_ecdf sample_to_process

    empirical_cdf_array = empirical_cdf['y_values'].sort
    # if distribution_name == 'exponential'
    puts "Distribution => #{distribution_name}"
    expo_class = ExponentialFunctions.new
    theoretical_exponential_cdf = expo_class.generate_theoretical_cdf sample_to_process
    theoretical_exponential_cdf = theoretical_exponential_cdf.sort
    # end

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