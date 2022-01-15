# frozen_string_literal: true

require_relative '../../../lib/statistical_libs/kolmogorov_smirnov_steps'
require_relative '../../../spec/fixtures/lib/statistical_libs/general_mocks'
require_relative '../../../spec/fixtures/lib/statistical_libs/exponential_functions_mocks'

describe KolmogorovSmirnovSteps do
  let(:kolmogorov_steps) do
    return described_class.new
  end

  let(:array_of_numbers) do
    return [12_296, 13_011, 12_008, 12_927, 14_874, 15_204, 14_694, 14_575, 13_415, 13_771]
  end

  describe '#calculate_d_value' do
    it 'should return an an value between 0 and 1' do
      theoretical_cdf_array = set_expected_theoretical_cdf_result
      empirical_cdf_array = [0.05, 0.2, 0.25, 0.35, 0.4, 0.45, 0.55, 0.6, 0.6, 0.6, 0.65, 0.65, 0.7, 0.7, 0.75, 0.8, 0.8, 0.85, 0.95, 1.0]
      expected_result = 0.25

      # puts theoretical_cdf_array.inspect
      result = kolmogorov_steps.calculate_d_value(empirical_cdf_array, theoretical_cdf_array)
      expect(result).to eql(expected_result)
    end
  end
end
