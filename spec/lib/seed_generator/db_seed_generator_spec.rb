# frozen_string_literal: true

require 'rails_helper'
require 'seed_generator/db_seed_generator'
require 'support/matchers'

describe DbSeedGenerator do
  before(:all) do
    City.create!('name' => 'City1', 'state' => 'S1', 'country' => 'BR')
    City.create!('name' => 'City2', 'state' => 'S2', 'country' => 'BR')
  end

  shared_examples 'returned hash should have the key' do |number_of_deliveries, bulk_size|
    it "should populate the database with #{number_of_deliveries} deliveries" do
      before_populate = Delivery.count
      described_class.new(2, 2, number_of_deliveries, %w[25/10/2010 25/10/2010], bulk_size).populate
      after_populate = Delivery.count
      expect(after_populate).to eql(before_populate + number_of_deliveries)
    end
  end

  let(:expected_date_time_result) { DateTime.new(2010, 10, 25, 10, 35, 20, '-02:00') }

  describe '#populate' do
    context 'when I call the method on DbSeedGenerator Class' do
      include_examples 'returned hash should have the key', 15, 10
      # include_examples 'returned hash should have the key', 1000, 100
      # include_examples 'returned hash should have the key', 10_000, 100
    end
  end
  # TODO: Add fail cases etc
end
