# frozen_string_literal: true

# Model for store RNG Methods (distribution based)
class DistributionMethod < ApplicationRecord
  has_many :distribution_methods_parameters, dependent: :destroy
  has_many :distribution_parameters, through: :distribution_methods_parameters, dependent: :destroy
end
