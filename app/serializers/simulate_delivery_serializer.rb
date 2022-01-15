# frozen_string_literal: true

# JSON Serializer
class SimulateDeliverySerializer < ActiveModel::Serializer
  attributes :id,
             :label,
             :steps,
             :simulation_data
end
