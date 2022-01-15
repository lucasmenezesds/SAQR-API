# frozen_string_literal: true

require 'seed_generator/seed_models/truck_seed'
require 'support/matchers'

describe TruckSeed do
  let(:truck) do
    described_class.new(10)
  end

  shared_examples 'returned hash should have the key' do |key, class_type|
    it "#{key} to be_a_kind_of #{class_type}" do
      truck_hash = truck.to_hash
      expect(truck_hash[key.to_s]).to be_a_kind_of(class_type)
    end
  end

  describe '#to_hash' do
    context 'when I call the method on truckSeed Class' do
      it 'should return the proper keys' do
        truck_hash = truck.to_hash
        expect(truck_hash).to include('driver_id', 'model')
      end
    end

    context 'when the I receive the returned hash expecting the key' do
      include_examples 'returned hash should have the key', :driver_id, Integer
      include_examples 'returned hash should have the key', :model, String
    end
  end
end
