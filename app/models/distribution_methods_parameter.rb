# frozen_string_literal: true

# N - M Relationship between distribution_method  and distribution_parameter
class DistributionMethodsParameter < ApplicationRecord
  belongs_to :distribution_method
  belongs_to :distribution_parameter
end
