# frozen_string_literal: true

require 'rails_helper'
require 'fixtures/seed_hash'

RSpec.describe Delivery, type: :model do
  before(:all) do
    @delivery = described_class.new(seed_hash)
    @durations = Delivery.duration_times(1, 2)
  end

  describe '#duration_times' do
    it 'should return an array' do
      expect(@durations).to be_a_kind_of(Array)
    end

    it 'should return an array with numbers' do
      durations_check = @durations.all? { |x| x.is_a? Integer }

      expect(durations_check).to be_truthy
    end
  end

  describe '#the_population?' do
    it 'should return true' do
      duration_size = @durations.size
      expect(Delivery.the_population?(duration_size)).to be_truthy
    end
  end
end
