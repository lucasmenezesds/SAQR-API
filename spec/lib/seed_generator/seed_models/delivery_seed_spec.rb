# frozen_string_literal: true

require 'seed_generator/seed_models/delivery_seed'
require 'fixtures/seed_hash'
require 'support/matchers'
require 'rails_helper'

describe DeliverySeed do
  let(:seeds_hash) do
    seed_hash
  end

  let(:delivery) do
    seeds_hash['delivery_date'] = DateTime.new(2010,
                                               10, 25,
                                               10, 35,
                                               20, '-03:00')

    described_class.new(seeds_hash)
  end

  let(:expected_date_time_result) { DateTime.new(2010, 10, 25, 10, 35, 20, '-03:00') }

  shared_examples 'returned hash should have the key' do |key, class_type|
    it "#{key} to be_a_kind_of #{class_type}" do
      delivery_hash = delivery.to_hash
      expect(delivery_hash[key.to_s]).to be_a_kind_of(class_type)
    end
  end

  describe '#to_hash' do
    context 'when the Class is created with id' do
      it 'should return a hash including the proper keys' do
        delivery_hash = delivery.to_hash
        expect(delivery_hash).to include('id', 'picking_time_id', 'load_time_id',
                                         'transportation_time_id', 'receive_time_id',
                                         'storage_time_id', 'delivery_date',
                                         'total_duration')
      end

      it 'should have the key id' do
        obj_hash = delivery.to_hash
        expect(obj_hash).to have_key('id')
      end
    end

    context 'when the Class is not created with id' do
      it 'should not have the key id' do
        new_obj = delivery
        new_obj.id = nil
        load_time_hash = new_obj.to_hash
        expect(load_time_hash).not_to have_key('id')
      end
    end

    context 'when the I receive the returned hash expecting the key' do
      include_examples 'returned hash should have the key', :id, Integer
      include_examples 'returned hash should have the key', :picking_time_id, PickingTime
      include_examples 'returned hash should have the key', :load_time_id, LoadTime
      include_examples 'returned hash should have the key', :transportation_time_id, TransportationTime
      include_examples 'returned hash should have the key', :receive_time_id, ReceiveTime
      include_examples 'returned hash should have the key', :storage_time_id, StorageTime
      include_examples 'returned hash should have the key', :delivery_date, DateTime
      include_examples 'returned hash should have the key', :total_duration, Integer
    end
  end
  context 'when I call the method on DeliverySeed Class' do
    describe '#delivery_time' do
      it 'should return the delivery date/time' do
        expect(delivery.delivery_time).to eql(expected_date_time_result)
      end
    end
    describe '#delivery_date' do
      it 'should work as #delivery_time' do
        expect(delivery.delivery_date).to eql(expected_date_time_result)
      end
    end
    describe '#sum_durations' do
      it 'should return the value 13601' do
        expect(delivery.sum_durations).to eql(13_601)
      end
    end
  end
end
