# frozen_string_literal: true

require_relative 'seed_class'

# Cargo Model Seed Generator
class CargoSeed < SeedClass
  def initialize(received_truck, received_delivery, received_id = nil)
    @id = received_id
    @truck_id = received_truck
    @delivery_id = received_delivery
  end
end
