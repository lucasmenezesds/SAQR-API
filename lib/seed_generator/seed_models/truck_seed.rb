# frozen_string_literal: true

require_relative 'seed_class'

# Trucks Model Seed Generator
class TruckSeed < SeedClass
  def initialize(driver_id)
    @driver_id = driver_id
    @model = %w[AZ3304 AW5504 ZH3204].sample # TODO: Hardcoded
  end
end
