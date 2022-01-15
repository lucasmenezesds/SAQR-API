# frozen_string_literal: true

require_relative 'seed_class'

# TransportationTimes Model Seed Generator
class TransportationTimeSeed < SeedClass
  def initialize(received_datetime, number_of_cities, current_id = nil)
    @id = current_id
    @duration_time = generate_time(1800, 3600) # TODO: CHECK VALUES
    @start_time = add_time(received_datetime, generate_time(1, 120), 'minutes')
    @transportation_date = received_datetime
    @origin_city_id = nil
    @destination_city_id = nil
    @distance = nil
    @event = [true, false].sample

    populate_cities_origin_dest(number_of_cities)
  end

  def generate_cities(number_of_cities, origin_city = false)
    return rand(1..number_of_cities) unless origin_city

    generated_city = rand(1..number_of_cities)
    generated_city = rand(1..number_of_cities) while generated_city == origin_city
    generated_city
  end

  def final_timestamp
    @start_time + @duration_time.seconds
  end

  def populate_cities_origin_dest(number_of_cities)
    # TODO: Improve the origin/destination city generator by getting existing Registred Cities
    @origin_city_id = generate_cities(number_of_cities)
    @destination_city_id = generate_cities(number_of_cities, @origin_city_id)
    # TODO: Develop distance model etc getting from the google_maps_consumer
    @distance = rand(50_000..1_500_000)
  end
end
