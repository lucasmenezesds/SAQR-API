# frozen_string_literal: true

# Delivery's Model Class
class Delivery < ApplicationRecord
  belongs_to :picking_time
  belongs_to :load_time
  belongs_to :transportation_time
  belongs_to :receive_time
  belongs_to :storage_time
  has_many :cargos

  def self.duration_times(city1, city2)
    Delivery.joins(:transportation_time)
            .where("origin_city_id=#{city1} and destination_city_id=#{city2}
               or origin_city_id=#{city2} and destination_city_id=#{city1}")
            .pluck(:total_duration)
  end

  def self.the_population?(number_of_samples)
    Delivery.count == number_of_samples
  end

  def steps_ids_based_on_city_deliveries(city1, city2)
    Delivery.joins(:transportation_time)
            .select(:id, :picking_time_id, :load_time_id, :transportation_time_id, :receive_time_id, :storage_time_id)
            .where("origin_city_id=#{city1} and destination_city_id=#{city2}
               or origin_city_id=#{city2} and destination_city_id=#{city1}")
            .as_json(only: %i[id picking_time_id load_time_id transportation_time_id receive_time_id storage_time_id])
            .each_with_object({}) { |pairs, new_hash| pairs.each { |key, value| (new_hash[key] ||= []) << value }; }
  end
end
