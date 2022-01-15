# frozen_string_literal: true

require_relative '../../../lib/utils/numo_narray_utils'

describe 'NumoArrayUtils' do
  # let(:numo_array_utils) { return described_class.new }

  describe '#convert_array_to_narray' do
    it 'should return an array of type Numo::DFloat' do
      result = NumoNarrayUtils.convert_array_to_narray([1, 2, 3])

      expect(result.class.to_s).to eq('Numo::DFloat')
    end

    it 'should return an error of not being an array' do
      expect { NumoNarrayUtils.convert_array_to_narray('1') }.to raise_error StandardError
    end

    it 'should return error of string convertion' do
      expect { NumoNarrayUtils.convert_array_to_narray(%w[1 2]) }.to raise_error StandardError
    end
  end
end
