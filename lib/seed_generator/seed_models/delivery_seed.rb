# frozen_string_literal: true

require_relative 'seed_class'

# Deliveries Model Seed Generator
class DeliverySeed < SeedClass
  def initialize(received_hash = {})
    @id = received_hash.fetch('id', nil)
    @picking_time_id = received_hash.fetch('picking_time')
    @load_time_id = received_hash.fetch('load_time')
    @transportation_time_id = received_hash.fetch('transportation_time')
    @receive_time_id = received_hash.fetch('receive_time')
    @storage_time_id = received_hash.fetch('storage_time')
    @delivery_date = received_hash.fetch('delivery_date')
    # be created and the others(picking_time date etc)will be based on this date
    @total_duration = sum_durations
  end

  def delivery_time
    @delivery_date
  end

  def sum_durations
    total_duration = 0
    [@picking_time_id, @load_time_id, @transportation_time_id, @receive_time_id, @storage_time_id].each do |model_obj|
      if model_obj['duration_time'].class == Integer
        total_duration += model_obj['duration_time']
      else
        throw('Something went wrong when I tried to get the duration_time')
      end
    end
    total_duration
  end

  def transform_objs_to_id
    @picking_time_id = @picking_time_id['id']
    @load_time_id = @load_time_id['id']
    @transportation_time_id = @transportation_time_id['id']
    @receive_time_id = @receive_time_id['id']
    @storage_time_id = @storage_time_id['id']
    self
  end

  alias delivery_date delivery_time
end
