# frozen_string_literal: true

require 'rspec'
require_relative '../../../../lib/statistical_libs/statistical_functions/exponential_functions'
require_relative '../../../../spec/fixtures/lib/statistical_libs/general_mocks'
require_relative '../../../../spec/fixtures/lib/statistical_libs/exponential_functions_mocks'

describe ExponentialFunctions do
  let(:expo_functions) do
    described_class.new
  end
  let(:sample, &method(:set_general_sample))

  let(:mle_result) do
    { sumup: 346_557.0,
      size: 20,
      mean: 17_327.85,
      lambda: 0.000057710564207330976 }
  end

  describe '#calculate_mle' do
    it 'should return an hash with the expected keys and values' do
      result = expo_functions.calculate_mle(sample)

      expect(result).to eql(mle_result)
    end
  end

  describe '#calculate_theoretical_cdf' do
    # TODO: check it
    it 'should return an array with the expected cdf values' do
      expected_result = set_expected_theoretical_cdf_result

      result = expo_functions.calculate_theoretical_cdf(sample, mle_result[:lambda])
      expect(result).to match_array(expected_result)
    end
  end

  describe '#generate_theoretical_cdf' do
    # TODO: check it
    it 'should return an array with the generated theoretical cdf' do
      expected_result = set_expected_theoretical_cdf_result
      result          = expo_functions.generate_theoretical_cdf(sample)

      expect(result).to match_array(expected_result)
    end
  end

  describe '#calculate_pdf' do
    it 'should return an array with the generated numbers of the pdf' do
      expected_result = [3.922892201624458e-05, 3.075665958240345e-05, 3.842453503390514e-05,
                         1.1566850847030122e-05, 1.2701144990238597e-05, 8.72782124950798e-06,
                         4.2552068458391e-05, 8.692132603969723e-06, 2.3936676198703045e-05,
                         2.9189841981876386e-05, 4.272924698537187e-05, 2.5054686803167426e-05,
                         8.90744636692683e-06, 1.729545351945656e-05, 3.3909496458101466e-05,
                         4.25618924077544e-05, 3.528091846099901e-05, 1.4304524822648531e-05,
                         7.362393067381842e-06, 2.5473121562623247e-05]

      result = expo_functions.calculate_pdf(sample, mle_result[:lambda])

      expect(result).to match_array(expected_result)
    end
  end
end
