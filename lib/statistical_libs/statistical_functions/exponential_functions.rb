# frozen_string_literal: true

require 'distribution'
require 'numo/gsl'

# class for methods of Exponential functions and it derivatives
class ExponentialFunctions
  attr_reader :mle_data

  def initialize
    @mle_data = {}
  end

  # Calculate the Maximum Likelihood Estimation for Exponential Distribution
  def calculate_mle(received_sample)
    if received_sample.class != Array || received_sample.empty?
      throw('calculate_mle should not receive empty array of numbers')
    else
      sorted_sample = received_sample.sort

      @mle_data[:size] = sorted_sample.size
      @mle_data[:sumup] = sorted_sample.sum * 1.0
      @mle_data[:mean] = @mle_data[:sumup] / @mle_data[:size].to_f
      @mle_data[:lambda] = 1 / @mle_data[:mean]
      @mle_data
    end
  rescue StandardError => e
    "Something went wrong during the calculation, Error: #{e}"
  end

  # Calculate the Expected(Theoretical) Cumulative Distribution Function for Exponential Distribution
  def calculate_theoretical_cdf(received_data, lambda)
    if (lambda.class != Integer || lambda.class != Float) && (received_data.class != Array || received_data.empty?)
      throw('calculate_theorical_cdf please recheck the parameters')
    else
      theoretical_distribution_array = []
      received_data.each do |element|
        cdf_element = Distribution::Exponential.cdf(element, lambda.to_f)
        theoretical_distribution_array.push(cdf_element)
      end
      theoretical_distribution_array
    end
  rescue StandardError => e
    "Something went wrong during the calculation, Error: #{e}"
  end

  def generate_theoretical_cdf(sample_to_process)
    calculate_mle sample_to_process
    calculate_theoretical_cdf sample_to_process, @mle_data[:lambda]
  end

  def calculate_pdf(received_data, lambda)
    if received_data.class != Array || received_data.empty?
      throw('#calculate_pdf please recheck the parameters')
    else
      final_data = []
      received_data.each do |element|
        final_data << Distribution::Exponential.pdf(element, lambda)
      end
      final_data
    end
  end

  # With NUMO/GSL
  # def calculate_theoretical_cdf2(received_data, mean)
  #   if (mean.class != Integer || mean.class != Float) && (received_data.class != Array || received_data.empty?)
  #     throw('calculate_theorical_cdf please recheck the parameters')
  #   else
  #     theoretical_distribution_array = []
  #     received_data.each do |element|
  #       cdf_element = Numo::GSL::Cdf.exponential_P(element, mean)
  #       theoretical_distribution_array.push(cdf_element)
  #     end
  #     theoretical_distribution_array
  #   end
  # rescue StandardError => e
  #   "Something went wrong during the calculation, Error: #{e}"
  # end

  # def generate_theoretical_fdp(lambda)
  #   rng = Distribution::Exponential.rng(lambda)
  #
  #   rng.call
  # end
end
