# frozen_string_literal: true

require 'numo/narray'
require 'numo/gsl'
require 'statsample'
require_relative '../../lib/utils/numo_narray_utils'

# Class
class KolmogorovSmirnovSteps
  def calculate_d_value(observed_cdf_array, theoretical_cdf_array)
    kolmogorov = Statsample::Test::KolmogorovSmirnov.new(theoretical_cdf_array, observed_cdf_array)
    kolmogorov.calculate
    kolmogorov.d
  end

  # # TODO: remove it / Fix it
  # def calculate_best_fit(array_of_numbers, aquele_rolezao)
  #   testing = Numo::GSL::Fit()
  #
  #   testing
  # end
end
