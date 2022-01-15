# frozen_string_literal: true

# JSON Serializer
class DistributionMethodSerializer < ActiveModel::Serializer
  attribute :id, key: :key
  attribute :short_name, key: :value
  attribute :capitalized_name, key: :text
  attribute :distribution_parameters, key: :parameters

  def distribution_parameters
    parameters =
      ActiveModelSerializers::SerializableResource.new(
        object.distribution_parameters,
        each_serializer: DistributionParameterSerializer,
        adapter: :json
      ).serializable_hash
    parameters[:distribution_parameters]
  end

  def capitalized_name
    object.name.capitalize
  end
end
