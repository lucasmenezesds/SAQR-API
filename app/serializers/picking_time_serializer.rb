# frozen_string_literal: true

# Serializer for the PickingTime
class PickingTimeSerializer < ActiveModel::Serializer
  attributes :id, :duration_time, :start_time, :number_of_items, :number_of_items_type, :picking_date

  has_one :delivery
end
