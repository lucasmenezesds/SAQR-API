# frozen_string_literal: true

# Serializer for Drivers
class DriverSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :contact

  has_one :truck
end
