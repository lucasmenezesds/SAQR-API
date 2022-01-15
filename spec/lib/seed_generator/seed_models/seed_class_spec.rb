# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext/numeric/time'
require 'seed_generator/seed_models/seed_class'
require 'support/matchers'

describe SeedClass do
  let(:seed_class) do
    described_class.new
  end
  shared_examples 'shared example add_time with valid params' do |expected_datetime, received_datetime, generated_time, time_type|
    it "should return the received date plus #{generated_time} #{time_type}" do
      allow(seed_class)
        .to receive(:generate_time)
        .with(an_instance_of(Integer), an_instance_of(Integer))
        .and_return(generated_time)

      final_date_time = seed_class.add_time(received_datetime, generated_time, time_type)
      expect(expected_datetime).to eql(final_date_time)
    end
  end

  shared_examples 'add_time shared example with invalid params' do |received_datetime, generated_time, time_type|
    it 'should return the received date without changes' do
      final_date_time = seed_class.add_time(received_datetime, generated_time, time_type)
      expect(received_datetime).to eql(final_date_time)
    end
  end

  describe '#to_hash' do
    context 'when I call the method without params' do
      it 'should return a hash with the class attributes as keys' do
        expect(seed_class.to_hash).to be_eql({})
      end
    end
  end

  describe '#generate_time' do
    context 'when I call the method passing 1 and 120 as parameters' do
      it 'should return value between 1 and 120' do
        expect(seed_class.generate_time(1, 120)).to be_between(1, 120)
      end

      it 'should return value between 1 and 13.5' do
        expect(seed_class.generate_time(1, 13.5)).to be_between(1, 13.5)
      end
    end
    context 'when I call the method with wrong parameters' do
      it 'should return 10 when the params are not Numbers' do
        expect(seed_class.generate_time('a', 123)).to be_eql(10)
      end
      it 'should return 10 when the params are not Numbers' do
        expect(seed_class.generate_time(321, '321')).to be_eql(10)
      end
    end
  end

  describe '#add_time' do
    date_time = DateTime.new(2010, 10, 25, 10, 35, 20, '-03:00')
    context 'when I call add_time passing valid params' do
      expected_date_10secs  = date_time + 10.seconds
      expected_date_10min   = date_time + 10.minutes
      expected_date_10hours = date_time + 10.hours
      include_examples 'shared example add_time with valid params', expected_date_10secs, date_time, 10, 'seconds'
      include_examples 'shared example add_time with valid params', expected_date_10min, date_time, 10, 'minutes'
      include_examples 'shared example add_time with valid params', expected_date_10hours, date_time, 10, 'hours'
    end

    context 'when I call add_time passing invalid params' do
      include_examples 'add_time shared example with invalid params', date_time, 10, 'xza'
      include_examples 'add_time shared example with invalid params', date_time, 'addsa', 'hours'
      include_examples 'add_time shared example with invalid params', '321321', 30, 'hours'
    end
  end
end
