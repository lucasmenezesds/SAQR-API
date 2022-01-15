# frozen_string_literal: true

# Serializer for Cities
class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :country
end
