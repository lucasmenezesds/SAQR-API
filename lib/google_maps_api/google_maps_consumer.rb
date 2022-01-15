# frozen_string_literal: true

# Google Maps API Consumer, it will get distance between 2 cities, no key needed
class GoogleMapsConsumer
  def initialize(origin_city_name, destination_city_name, current_request_number)
    @origin_city_name = origin_city_name
    @destination_city_name = destination_city_name
    @current_request_number = current_request_number
  end

  def cities_distances(origin_city = @origin_city_name,
                       destination_city = @destination_city_name,
                       _current_req_number = @current_request_number)

    # TODO: Develop the API consumer, did just to keep developing
    # the seed for generator now
    # puts origin_city
    # puts destination_city
    # puts current_req_number

    return 591_239 if origin_city == 'Uberlandia' && destination_city == 'Sao Paulo'

    0
  end
end
