# frozen_string_literal: true

require 'numo/gsl'
require 'securerandom'

# Module to Generate Number based on a distribution
module RandomNumbersGenerator
  def self.random_number
    SecureRandom.random_number(999_999_999_999_999)
  end

  def self.random_generator(distribution_name, distribution_parameters)
    random_generator = Numo::GSL::Rng::Rand.new(random_number)

    case distribution_name
    when 'exp'
      mu = distribution_parameters[:mu].to_f
      random_generator.exponential(mu)
      # data = random_generator.exponential(distribution_parameters[:mu], distribution_parameters[:shape]) if distribution_parameters[:shape]
    when 'lognorm'
      zeta = distribution_parameters[:zeta].to_f
      sigma = distribution_parameters[:sigma].to_f
      random_generator.lognormal(zeta, sigma)
      # data = random_generator.lognormal(distribution_parameters[:zeta], distribution_parameters[:sigma], distribution_parameters[:shape])
    when 'gamma'
      alpha = distribution_parameters[:alpha].to_f
      beta = distribution_parameters[:beta].to_f
      random_generator.gamma(alpha, beta)
      # data = random_generator.gamma(distribution_parameters[:alpha], distribution_parameters[:beta], distribution_parameters[:shape])
    when 'weibull'
      alpha = distribution_parameters[:alpha].to_f
      beta = distribution_parameters[:beta].to_f
      random_generator.weibull(alpha, beta)
      # data = random_generator.weibull(distribution_parameters[:alpha], distribution_parameters[:beta], distribution_parameters[:shape])

    else
      raise NoMethodError, "The #{distribution_name} method does not exist"
    end
  end

  def self.distribution_based_generation(number_of_samples, distribution_name, distribution_parameters)
    number_of_samples = number_of_samples.to_i
    raise TypeError, 'number_of_samples is not a integer' unless number_of_samples.is_a? Integer

    arr = []
    number_of_samples.times do
      arr << random_generator(distribution_name, distribution_parameters)
    end
    arr
  end
end
