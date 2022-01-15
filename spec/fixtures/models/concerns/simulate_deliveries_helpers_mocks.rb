# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
def steps_list
  [
    {
      delivery_step: 'picking_time',
      distribution_method: {
        name: 'exp',
        parameters: [
          {
            name: 'mu',
            value: 10,
            uppercase: false
          }
        ]
      }
    },
    {
      delivery_step: 'load_time',
      distribution_method: {
        name: 'gamma',
        parameters: [
          {
            name: 'mu',
            value: 10,
            uppercase: false
          }
        ]
      }
    },
    {
      delivery_step: 'receive_time',
      distribution_method: {
        name: 'weibull',
        parameters: [
          {
            name: 'mu',
            value: 10,
            uppercase: false
          }
        ]
      }
    }
  ]
end

# rubocop:enable Metrics/MethodLength

def generated_arrays
  [[10, 61, 60], [5, 90, 11], [30, 500, 1]]
end

def mean_for_generated_arrays
  [15, 217, 24]
end

def expected_statistical_data
  {
    data: [15, 217, 24],
    mean: 85.33333333333333,
    std_dev: 114.11543862831766,
    data_size: 3,
    max_value: 217.0,
    min_value: 15.0,
    variance: 13_022.333333333336
  }
end
