# frozen_string_literal: true

require_relative 'seed_class'

# LoadTimes Model Seed Generator
class LoadTimeSeed < SeedClass
  def initialize(received_datetime, current_id = nil)
    @id = current_id
    @duration_time = generate_time(1800, 3800) # TODO: CHECK VALUES
    @start_time = add_time(received_datetime, generate_time(1, 120), 'minutes')
    @event = [true, false].sample
    @load_date = received_datetime
  end

  def final_timestamp
    @start_time + @duration_time.seconds
  end
end
