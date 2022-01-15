# frozen_string_literal: true

require 'seed_generator/seed_models/cargo_seed'
require 'support/matchers'

describe CargoSeed do
  let(:cargo) do
    described_class.new(1, 1, 10)
  end

  shared_examples 'returned hash should have the key' do |key, class_type|
    it "#{key} to be_a_kind_of #{class_type}" do
      cargo_hash = cargo.to_hash
      expect(cargo_hash[key.to_s]).to be_a_kind_of(class_type)
    end
  end

  describe '#to_hash' do
    context 'when the Class is created with id' do
      it 'should return a hash including the proper keys' do
        cargo_hash = cargo.to_hash
        expect(cargo_hash).to include('truck_id', 'delivery_id', 'id')
      end

      it 'should have the key id' do
        obj_hash = cargo.to_hash
        expect(obj_hash).to have_key('id')
      end
    end

    context 'when the Class is not created with id' do
      it 'should not have the key id' do
        new_obj = cargo
        new_obj.id = nil
        cargo_hash = new_obj.to_hash
        expect(cargo_hash).not_to have_key('id')
      end
    end

    context 'when the I receive the returned hash expecting the key' do
      include_examples 'returned hash should have the key', :id, Integer
      include_examples 'returned hash should have the key', :truck_id, Integer
      include_examples 'returned hash should have the key', :delivery_id, Integer
    end
  end
end
