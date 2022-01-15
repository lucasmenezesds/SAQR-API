# frozen_string_literal: true

# JSON Serializer
class DistributionParameterSerializer < ActiveModel::Serializer
  attributes :id, :name, :symbol, :meaning
end
