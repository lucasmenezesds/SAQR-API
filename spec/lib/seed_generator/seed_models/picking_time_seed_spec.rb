# frozen_string_literal: true

require 'seed_generator/seed_models/picking_time_seed'
require 'support/matchers'

describe PickingTimeSeed do
  let(:picking_time) do
    described_class.new(DateTime.new(2010,
                                     10, 25,
                                     10, 35,
                                     20, '-03:00'), 10)
  end

  let(:expected_date_time_result) { DateTime.new(2010, 10, 25, 10, 35, 20, '-03:00') }

  shared_examples 'returned hash should have the key' do |key, class_type|
    it "#{key} to be_a_kind_of #{class_type}" do
      picking_time_hash = picking_time.to_hash
      expect(picking_time_hash[key.to_s]).to be_a_kind_of(class_type)
    end
  end

  describe '#to_hash' do
    context 'when the Class is created with id' do
      it 'should return a hash including the proper keys' do
        picking_time_hash = picking_time.to_hash
        expect(picking_time_hash).to include('id', 'duration_time', 'start_time',
                                             'number_of_items', 'number_of_items_type',
                                             'picking_date', 'event')
      end

      it 'should have the key id' do
        picking_time_hash = picking_time.to_hash
        expect(picking_time_hash).to have_key('id')
      end
    end

    context 'when the Class is not created with id' do
      it 'should not have the key id' do
        new_picking_time = picking_time
        new_picking_time.id = nil
        picking_time_hash = new_picking_time.to_hash
        expect(picking_time_hash).not_to have_key('id')
      end
    end

    context 'when the I receive the returned hash expecting the key' do
      include_examples 'returned hash should have the key', :id, Integer
      include_examples 'returned hash should have the key', :duration_time, Integer
      include_examples 'returned hash should have the key', :start_time, DateTime
      include_examples 'returned hash should have the key', :number_of_items, Integer
      include_examples 'returned hash should have the key', :number_of_items_type, Integer
      include_examples 'returned hash should have the key', :picking_date, DateTime

      it 'event to be_a_kind_of Boolean' do
        picking_time_hash = picking_time.to_hash
        expect(picking_time_hash['event']).to be_a_kind_of_boolean
      end
    end
  end

  describe '#final_timestamp' do
    context 'when I callthe method on PickingTimeSeed Class' do
      it 'should return the date plus 61 minutes' do
        # it will mock start_time and duration_time
        allow_any_instance_of(PickingTimeSeed).to receive(:generate_time).and_return(60)

        # 60 minutes from the add_time at @start_time and 1 minute from @duration_time
        expected_final_stamp = expected_date_time_result + 61.minutes
        final_timestamp = picking_time.final_timestamp

        expect(expected_final_stamp).to eql(final_timestamp)
      end
    end
  end
end
