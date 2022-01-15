# frozen_string_literal: true

require_relative '../../../lib/utils/auxiliary_functions'

describe AuxiliaryFunctions do
  describe '#get_statistical_function_class' do
    let(:func_aux, &method(:described_class))

    it 'should return an Statistical Function Class' do
      statistical_class = func_aux.get_statistical_function_class 'exponential'
      expect(statistical_class.class.to_s).to eq('Class')
    end

    it 'should throw an error when the parameter is not an string' do
      expect { func_aux.get_statistical_function_class 321 }.to(
        raise_error(ArgumentError, 'Check #get_statistical_function_class condition: The name passed as parameter is invalid')
      )
    end

    it 'should throw an error when the function name doesnt exist' do
      expect { func_aux.get_statistical_function_class 'invalid_func' }.to(
        raise_error(ArgumentError, 'Check #get_statistical_function_class condition: The name passed as parameter is invalid')
      )
    end
  end
end
