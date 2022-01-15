# frozen_string_literal: true

require 'seed_generator/seed_models/driver_seed'
require 'support/matchers'

describe DriverSeed do
  let(:driver) do
    described_class.new
  end

  shared_examples 'returned hash should have the key' do |key, class_type|
    it "#{key} to be_a_kind_of #{class_type}" do
      driver_hash = driver.to_hash
      expect(driver_hash[key.to_s]).to be_a_kind_of(class_type)
    end
  end

  describe '#to_hash' do
    context 'when I call the method on DriverSeed Class' do
      it 'should return the proper keys' do
        driver_hash = driver.to_hash
        expect(driver_hash).to include('name', 'age', 'contact')
      end
    end

    context 'when the I receive the returned hash expecting the key' do
      include_examples 'returned hash should have the key', :name, String
      include_examples 'returned hash should have the key', :age, Integer
      include_examples 'returned hash should have the key', :contact, String
    end
  end
end
