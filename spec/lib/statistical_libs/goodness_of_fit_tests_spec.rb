# frozen_string_literal: true

require_relative '../../../spec/fixtures/lib/statistical_libs/general_mocks'
require_relative '../../../lib/statistical_libs/goodness_of_fit_tests'

describe GoodnessOfFitTests do
  let(:gof_class) { described_class.new }
  let(:sample, &method(:set_general_sample))

  describe '#kolmogorov_smirnov_test' do
    it 'should return the expected float value for exponential distribution' do
      expected_result = 0.25

      result = gof_class.kolmogorov_smirnov_test sample, 'exponential'
      # [0.3202471236408164, 0.4670532162550505, 0.3341854206127469, 0.7995713435502891, 0.7799164647808942,
      # 0.8487656225617132, 0.2626641405632695, 0.8493840300583032, 0.5852288653303035, 0.4942027966143433,
      # 0.25959401762452416, 0.5658561452777353, 0.8456531054708469, 0.7003069757328846, 0.4124213317984866,
      # 0.26249391264229305, 0.38865753704557837, 0.7521333395518697, 0.8724255572873676, 0.5586055705310988]

      # [0.3202471236408164, 0.4670532162550505, 0.3341854206127469, 0.7995713435502891, 0.7799164647808942,
      # 0.8487656225617132, 0.2626641405632695, 0.8493840300583032, 0.5852288653303035, 0.4942027966143433,
      # 0.25959401762452416, 0.5658561452777353, 0.8456531054708469, 0.7003069757328846, 0.4124213317984866,
      # 0.26249391264229305, 0.38865753704557837, 0.7521333395518697, 0.8724255572873676, 0.5586055705310988]

      # puts result.inspect

      expect(result).to eql expected_result
    end

    it 'should throw an error' do
      expect { gof_class.kolmogorov_smirnov_test sample, 'test' }.to(
        raise_error(ArgumentError,
                    'Check #get_statistical_function_class condition: The name passed as parameter is invalid')
      )
    end
  end

  # describe '#anderson_darlin_test' do
  #   it 'should return the expected float value' do
  #
  #     result = gof_class.anderson_darlin_test
  #
  #     expect(result).to be true
  #   end
  # end
  #
  # describe '#chi_square_test' do
  #   it 'should return the expected float value' do
  #     result = gof_class.chi_square_test
  #
  #     expect(result).to be true
  #   end
  # end
end
