# frozen_string_literal: true

require 'numo/gsl'
require 'securerandom'

# Module to Generate Number based on a distribution
class RandomNumbersGenerator
  def initialize(start_value = 120, end_value = 720)
    @start_value = start_value
    @end_value = end_value
  end

  def secure_random_number
    SecureRandom.random_number(@start_value..@end_value)
  end

  def random_generator(distribution_name, distribution_parameters)
    gsl_random_generator = Numo::GSL::Rng::Rand.new(secure_random_number)

    case distribution_name
    when 'exp'
      mu = 1 / distribution_parameters[:lambda].to_f # lambda = 1 / mean  & mean = 1 / lambda
      final_val = gsl_random_generator.exponential(mu)
    when 'lognorm'
      mu = distribution_parameters[:mu].to_f
      sigma = distribution_parameters[:sigma].to_f
      final_val = gsl_random_generator.lognormal(mu, sigma)
    when 'gamma'
      alpha = distribution_parameters[:alpha].to_f
      beta = distribution_parameters[:beta].to_f
      final_val = gsl_random_generator.gamma(alpha, beta)
    when 'weibull'
      alpha = distribution_parameters[:alpha].to_f
      beta = distribution_parameters[:beta].to_f
      final_val = gsl_random_generator.weibull(alpha, beta)
    else
      raise NoMethodError, "The #{distribution_name} method does not exist"
    end

    raise TypeError, "The number generated for #{distribution_name} was Null, check your parameters value" if final_val.nil?

    final_val
  end

  def distribution_based_generation(number_of_samples, distribution_name, distribution_parameters)
    number_of_samples = number_of_samples.to_i
    raise TypeError, 'number_of_samples is not a integer' unless number_of_samples.is_a? Integer

    arr = []
    number_of_samples.times do
      arr << random_generator(distribution_name, distribution_parameters)
    end
    arr
  end
end
