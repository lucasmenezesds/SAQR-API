# frozen_string_literal: true

require 'rspec'
require_relative '../../../../lib/statistical_libs/statistical_functions/gamma_functions'
require_relative '../../../../spec/fixtures/lib/statistical_libs/general_mocks'
require_relative '../../../../spec/fixtures/lib/statistical_libs/gamma_functions_mocks'

describe GammaFunctions do
  rgamma_generated = [9123.142, 8878.406, 8879.861, 9090.261, 9050.099, 9107.610, 8989.166,
                      9245.454, 9016.319, 9019.840, 8990.125, 9119.281, 9097.143, 9013.309,
                      9027.783, 9056.372, 9076.079, 9018.672, 8872.362, 9066.872]
  let(:gamma_functions, &method(:described_class))
  let(:sample, &method(:set_general_sample))

  let(:mle_result) do
    #   #TODO clean it
    # { sumup:      346_557.0,
    #   size:       20,
    #   mean:       17_327.85,
    #   alfa:       17327.85,
    #   beta:       1.0,
    #   ln_mean:    9.555165405870616,
    #   ln_of_mean: 9.760070312693609,
    #   ln_sumup:   191.10330811741233,
    #
    #   # ok
    #   ln_data: [8.557951183888406, 8.570923513837204, 8.571681376700306, 8.808219665118408,
    #             8.860499167616016, 9.050992878742049, 9.128479345495862, 9.29697667863573,
    #             9.376786579611847, 9.55895290182487, 9.579003173560242, 9.632269206115012,
    #             9.946547041996576, 10.09286747369753, 10.17465907286092, 10.23462415135353,
    #             10.38523445880145, 10.396077920037964, 10.398244768123055, 10.482317559395355]
    # }
    { size: 20,
      sumup: 180_738.15600000002,
      mean: 9036.9078,
      ln_of_mean: 9.10907233734908,
      ln_data: [9.090696330722599, 9.091377315368849, 9.09154118271055, 9.103775353418127, 9.103882031707155,
                9.106457541781005, 9.106791436637621, 9.107052373836133, 9.10718187454014, 9.108062101317136,
                9.110530975860659, 9.111223877337812, 9.112382610418361, 9.113397550136861, 9.114958899630604,
                9.11571568716647, 9.116865606767508, 9.118146242241222, 9.118569541279694, 9.13188725024123],
      ln_sumup: 182.1804957831197,
      ln_mean: 9.109024789155985,
      alfa: 10_515.813368280122,
      beta: 1.0 }
  end

  describe '#calculate_mle' do
    it 'should return an hash with the expected keys and values' do
      result = gamma_functions.calculate_mle(rgamma_generated)

      mle_result.each do |key, mle_value|
        next if mle_value.is_a?(Array)
        expect(result[key].round(5)).to eql(mle_value.round(5))
      end
      expect(result[:ln_data]).to eql(mle_result[:ln_data])
    end
  end

  # describe '#calculate_theoretical_cdf' do
  #   #TODO develop it
  #   it 'should return an array with the expected cdf values' do
  #     expected_result = set_expected_theoretical_cdf_result
  #
  #     result = gamma_functions.calculate_theoretical_cdf(sample, mle_result[:lambda])
  #     expect(result).to match_array(expected_result)
  #   end
  # end
  #
  # describe '#generate_theoretical_cdf' do
  #   #TODO develop it
  #   it 'should return an array with the generated theoretical cdf' do
  #     expected_result = set_expected_theoretical_cdf_result
  #     result          = gamma_functions.generate_theoretical_cdf(sample)
  #
  #     expect(result).to match_array(expected_result)
  #   end
  # end
  #
  # describe '#calculate_pdf' do
  #   it 'should return an array with the generated numbers of the pdf' do
  #     expected_result = [3.922892201624458e-05, 3.075665958240345e-05, 3.842453503390514e-05,
  #                        1.1566850847030122e-05, 1.2701144990238597e-05, 8.72782124950798e-06,
  #                        4.2552068458391e-05, 8.692132603969723e-06, 2.3936676198703045e-05,
  #                        2.9189841981876386e-05, 4.272924698537187e-05, 2.5054686803167426e-05,
  #                        8.90744636692683e-06, 1.729545351945656e-05, 3.3909496458101466e-05,
  #                        4.25618924077544e-05, 3.528091846099901e-05, 1.4304524822648531e-05,
  #                        7.362393067381842e-06, 2.5473121562623247e-05]
  #
  #     result = gamma_functions.calculate_pdf(sample, mle_result[:lambda])
  #
  #     expect(result).to match_array(expected_result)
  #   end
  #
  # end
end
