# frozen_string_literal: true

# Model to list the parameters needed for each RNG Distribution Method
class DistributionParameter < ApplicationRecord
  has_many :distribution_methods_parameters, dependent: :destroy
  has_many :distribution_method, through: :distribution_methods_parameters
end
