require_relative '../../../lib/google_maps_api/google_maps_consumer'

describe GoogleMapsConsumer do
  let(:maps_consumer) do
    described_class.new('Uberlândia', 'São Paulo', 10)
  end

  describe '#get_city_distances' do
    it 'should return 591239 for Uberlandia and Sao Paulo' do
      expected_distance = 591239
      received_distance = maps_consumer.get_city_distances('Uberlandia', 'Sao Paulo', 10)

      expect(expected_distance).to equal(received_distance)
    end
  end

end