# frozen_string_literal: true

require 'faker'
require 'active_record'
require 'activerecord-import'

Dir[File.join(Rails.root, 'lib/seed_generator/seed_models/*.rb')].each do |file|
  require file
end

# IMPORTANT
#
# The times and dates are not important it exist just to be quite similar to
# a real application, but I don't use it for measuring anything
#

# rubocop:disable Metrics/ClassLength

# Seed Generator Based on DB Schema
class DbSeedGenerator
  def initialize(cities_number = 100, number_of_drivers = 100,
                 number_of_deliveries = 1, range_date = %w[01/01/2000 31/12/2017],
                 bulk_size = 100)
    @cities_number        = cities_number
    @number_of_drivers    = number_of_drivers
    @number_of_deliveries = number_of_deliveries
    @range_date           = range_date
    @bulk_size            = bulk_size
    @models_array         = {}
    prepare_delivery_hash
  end

  def populate
    puts '[START] Populating with DbSeedGenerator'
    create_driver_and_trucks
    # deliveries_array = []
    last_delivery = Delivery.last
    last_id       = if last_delivery.nil?
                      1
                    else
                      last_delivery['id'] += 1
                    end
    bulk_id       = last_id
    @number_of_deliveries.times do |i|
      if @models_array['delivery'].size < @bulk_size
      else
        bulk_insertion
        puts "Generating Delivery Number #{i}"
      end
      generate_complete_delivery(bulk_id)
      bulk_id += 1
    end
    bulk_insertion
    puts "[DONE] Populating is over, the total of Deliveries are: #{Delivery.count}"
  end

  private

  def bulk_insertion
    PickingTime.import @models_array['picking_time'] # , validate: true
    LoadTime.import @models_array['load_time'] # , validate: true
    TransportationTime.import @models_array['transportation_time'] # , validate: true
    ReceiveTime.import @models_array['receive_time'] # , validate: true
    StorageTime.import @models_array['storage_time'] # , validate: true

    Delivery.import @models_array['delivery'] # , validate: true
    Cargo.import @models_array['cargo'] # , validate: true
    prepare_delivery_hash
  end

  def create_cargo(current_id)
    last_delivery = @models_array['delivery'].last
    truck         = Truck.all.sample
    cargo         = CargoSeed.new(truck.id, last_delivery.id, current_id)

    @models_array['cargo'] << cargo.to_hash
  end

  def create_delivery_data_dependencies(delivery_hash, current_id)
    date = delivery_hash['delivery_date']

    picking                 = PickingTimeSeed.new(date, current_id)
    picking_final_timestamp = picking.final_timestamp
    picking_hash            = picking.to_hash
    @models_array['picking_time'] << picking_hash
    delivery_hash['picking_time'] = picking_hash

    load                 = LoadTimeSeed.new(picking_final_timestamp, current_id)
    load_final_timestamp = load.final_timestamp
    load_hash            = load.to_hash
    @models_array['load_time'] << load_hash
    delivery_hash['load_time'] = load_hash

    transportation                 = TransportationTimeSeed.new(load_final_timestamp,
                                                                @cities_number, current_id)
    transportation_final_timestamp = transportation.final_timestamp
    transportation_hash            = transportation.to_hash
    @models_array['transportation_time'] << transportation_hash
    delivery_hash['transportation_time'] = transportation_hash

    received                 = ReceiveTimeSeed.new(transportation_final_timestamp, current_id)
    received_final_timestamp = received.final_timestamp
    receive_hash             = received.to_hash
    @models_array['receive_time'] << receive_hash
    delivery_hash['receive_time'] = receive_hash

    storage      = StorageTimeSeed.new(received_final_timestamp, current_id)
    storage_hash = storage.to_hash
    @models_array['storage_time'] << storage_hash
    delivery_hash['storage_time'] = storage_hash

    delivery_hash
  end

  def create_delivery_data(rec_delivery_hash, current_id)
    delivery_hash                  = create_delivery_data_dependencies(rec_delivery_hash, current_id)
    delivery_hash['delivery_date'] = delivery_hash['delivery_date'].to_s
    delivery_hash['id']            = current_id

    delivery = DeliverySeed.new(delivery_hash).transform_objs_to_id
    @models_array['delivery'] << Delivery.new(delivery.to_hash)
  end

  def create_driver_and_trucks
    @number_of_drivers.times do
      new_driver     = DriverSeed.new
      created_driver = Driver.create!(new_driver.to_hash)
      created_truck  = TruckSeed.new(created_driver.id)
      Truck.create!(created_truck.to_hash)
    end
  end

  def generate_complete_delivery(current_id)
    delivery_hash                  = {}
    delivery_hash['delivery_date'] = Faker::Time.between(from:@range_date[0],
                                                         to: @range_date[1]).to_datetime

    create_delivery_data(delivery_hash, current_id)
    create_cargo(current_id)
  end

  def prepare_delivery_hash
    @models_array['picking_time']        = []
    @models_array['load_time']           = []
    @models_array['transportation_time'] = []
    @models_array['receive_time']        = []
    @models_array['storage_time']        = []
    @models_array['cargo']               = []
    @models_array['delivery']            = []
  end
end
# rubocop:enable Metrics/ClassLength
