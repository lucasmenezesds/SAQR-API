# frozen_string_literal: true

require_relative 'seed_class'

# Drivers Model Seed Generator
class DriverSeed < SeedClass
  def initialize
    @name = Faker::Name.name
    @age = rand(18..65)
    @contact = '+553400000000' # TODO: Hardcoded
  end
end
