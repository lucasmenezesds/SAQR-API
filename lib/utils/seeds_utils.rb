# frozen_string_literal: true

# Module to help process Seeds Data
module SeedsUtils
  def self.process_methods_parameters(methods_params_list, distribution_methods, distribution_params)
    final_array = []
    methods_params_list.each do |current_param|
      param_filter = { name: current_param['parameter_name'], uppercase: current_param['uppercase'] }
      method       = distribution_methods.find_by_name(current_param['method_name'])
      param        = distribution_params.find_by(param_filter)

      final_array << { distribution_method_id: method.id, distribution_parameter_id: param.id }
    end
    final_array
  end
end
