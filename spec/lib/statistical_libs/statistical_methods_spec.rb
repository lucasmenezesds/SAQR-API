# frozen_string_literal: true

require_relative '../../../lib/statistical_libs/statistical_methods'
require_relative '../../../spec/fixtures/lib/statistical_libs/general_mocks'
require_relative '../../../spec/fixtures/lib/statistical_libs/exponential_functions_mocks'

describe StatisticalMethods do
  let(:statistical_methods, &method(:described_class))
  let(:sample, &method(:set_general_sample))

  describe '#calculate_ecdf' do
    let(:calculated_ecdf) { statistical_methods.calculate_ecdf(sample) }

    it 'should return an Hash with 2 keys' do
      number_of_keys = calculated_ecdf.keys.length

      expect(number_of_keys).to eql(2)
    end

    it 'should return the expected X values' do
      expected_value = set_linspace_result_from_sample
      result         = calculated_ecdf['x_values']

      expect(result).to eql expected_value
    end

    it 'should return the expected Y values' do
      expected_value = [0.05, 0.2, 0.25, 0.35, 0.4, 0.45, 0.55, 0.6, 0.6, 0.6,
                        0.65, 0.65, 0.7, 0.7, 0.75, 0.8, 0.8, 0.85, 0.95, 1.0]
      result         = calculated_ecdf['y_values']

      expect(result).to eql expected_value
    end
  end

  describe '#get_natural_logarithm_array' do
    it 'should return an array with the generated numbers of the natural log' do
      expected_result = [8.808219665118408, 9.29697667863573, 8.860499167616016, 10.23462415135353,
                         10.17465907286092, 10.396077920037964, 8.571681376700306, 10.398244768123055,
                         9.632269206115012, 9.376786579611847, 8.557951183888406, 9.579003173560242,
                         10.38523445880145, 9.946547041996576, 9.128479345495862, 8.570923513837204,
                         9.050992878742049, 10.09286747369753, 10.482317559395355, 9.55895290182487]

      result = statistical_methods.get_natural_logarithm_array sample
      expect(result).to match_array(expected_result)
    end
  end
end
