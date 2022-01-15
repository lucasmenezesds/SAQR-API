# frozen_string_literal: true

require 'distribution'
require 'gsl'
require 'numo/gsl'
require_relative '../statistical_methods'

# Module for methods of Gamma functions and it derivatives
module GammaFunctions
  # rubocop: disable Naming/MethodParameterName
  def self.calculate_alfa_for_mle(a0, mle_data)
    new_a0 = a0
    loop do
      a1 = (new_a0 * (StatisticalMethods.get_natural_logarithm(new_a0) - GSL::Sf.psi(new_a0))) / (mle_data[:ln_of_mean] - mle_data[:ln_mean])

      error = (a1 - new_a0).abs

      new_a0 = a1
      break if error <= (10**-6)
    end
    new_a0
  end

  # rubocop: enable Naming/MethodParameterName

  # Calculate the Maximum Likelihood Estimation for Exponential Distribution
  def self.calculate_mle(received_sample)
    mle_data = {}
    if received_sample.class != Array || received_sample.empty?
      throw('calculate_mle should not receive empty array of numbers')
    else
      sorted_sample = received_sample.sort

      mle_data[:size]       = sorted_sample.size
      mle_data[:sumup]      = sorted_sample.sum * 1.0
      mle_data[:mean]       = mle_data[:sumup] / mle_data[:size].to_f
      mle_data[:ln_of_mean] = StatisticalMethods.get_natural_logarithm mle_data[:mean] # lnmeadia
      mle_data[:ln_data]    = StatisticalMethods.get_natural_logarithm_array sorted_sample # lndados
      mle_data[:ln_sumup]   = mle_data[:ln_data].sum * 1.0 # s2
      mle_data[:ln_mean]    = mle_data[:ln_sumup] / mle_data[:size] # m2

      a0 = mle_data[:mean]

      new_a0          = calculate_alfa_for_mle(a0, mle_data)
      mle_data[:alfa] = new_a0
      mle_data[:beta] = mle_data[:mean] / a0

      mle_data
    end
  rescue StandardError => e
    "Something went wrong during the calculation GammaFunctions#calculate_mle, Error: #{e}"
  end
end
