# frozen_string_literal: true

# Serializer for the ReceiveTimes
class ReceiveTimeSerializer < ActiveModel::Serializer
  attributes :id, :duration_time, :start_time, :event, :received_date

  has_one :delivery
end
