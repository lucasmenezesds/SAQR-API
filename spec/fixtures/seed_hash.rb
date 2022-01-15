# frozen_string_literal: true

def seed_hash
  seeds_hash = {}
  seeds_hash['picking_time'] = PickingTime.new(duration_time: 3185,
                                               start_time: '2001-10-08 17:59:15',
                                               number_of_items: 757,
                                               number_of_items_type: 4,
                                               picking_date: '2001-10-08 17:58:15')

  seeds_hash['load_time'] = LoadTime.new(duration_time: 2047,
                                         event: false, load_date: '2001-10-08 18:52:20',
                                         start_time: '2001-10-08 20:02:20')

  seeds_hash['transportation_time'] = TransportationTime.new(duration_time: 2045,
                                                             event: false,
                                                             transportation_date: '2001-10-08 20:36:27',
                                                             origin_city_id: 10,
                                                             destination_city_id: 7,
                                                             start_time: '2001-10-08 21:41:27',
                                                             distance: 1_158_632)

  seeds_hash['receive_time'] = ReceiveTime.new(duration_time: 2981,
                                               event: true,
                                               received_date: '2001-10-08 22:15:32',
                                               start_time: '2001-10-08 22:40:32')

  seeds_hash['storage_time'] = StorageTime.new(duration_time: 3343,
                                               event: false,
                                               storage_date: '2001-10-08 23:30:13',
                                               start_time: '2001-10-09 00:07:13')

  seeds_hash['id'] = 10

  seeds_hash['delivery_date'] = DateTime.new(2010,
                                             10, 25,
                                             10, 35,
                                             20, '-03:00')

  seeds_hash
end
