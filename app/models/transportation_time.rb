# frozen_string_literal: true

# TransportationTime's Model Class
class TransportationTime < ApplicationRecord
  has_one :delivery
  belongs_to :origin_city, class_name: 'City', foreign_key: 'origin_city_id'
  belongs_to :destination_city, class_name: 'City', foreign_key: 'destination_city_id'

  def self.durations_time_based_on_ids_list(ids_array); end
end
