# frozen_string_literal: true

require 'rspec'
require_relative '../../../../lib/statistical_libs/statistical_functions/z_table'
require_relative '../../../fixtures/lib/statistical_libs/z_table_mocks'

describe Ztable do
  context 'success: passing the correct parameters' do
    describe '#z_value' do
      it 'should return the expected result' do
        result = Ztable.z_score(0.85)

        expect(result).to eql(1.04)
      end
    end

    describe '#percentile' do
      it 'should return the expected result' do
        result = Ztable.percentile(1.22)

        expect(result).to eql(0.8888)
      end
    end

    describe '#[]' do
      it 'should return the expected result' do
        result = Ztable[1.12]

        expect(result).to eql(0.8686)
      end
    end

    describe '#values' do
      it 'should return the expected result' do
        result = Ztable.values

        expect(result).to eql(z_table_data)
      end
    end
  end
end
