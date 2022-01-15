# frozen_string_literal: true

require_relative './z_table'

# Module with Normal Distribution Methods
module NormalDistributionFunctions
  # TODO: Implement it
  def self.confidence_interval_for_mean(sample_size, mean, std_dev, alpha)
    raise NotImplementedError, 'Confidence Interval for Mean is Not implemented yet for samples smaller than 30' if sample_size < 30

    # alpha is the Confidence Level
    margin_of_error = (1 - alpha)

    # Z_alpha/2 Value
    left_over_area = margin_of_error / 2

    # Z Area for the Positive Z Table
    left_z_area = 1 - left_over_area

    # This is the Z point in the Graph
    z_score = Ztable.z_score(left_z_area)

    min_interval = mean - z_score * (std_dev.to_f / Math.sqrt(sample_size))
    max_interval = mean + z_score * (std_dev.to_f / Math.sqrt(sample_size))

    { min_interval: min_interval.round(4), max_interval: max_interval.round(4) }
  end

  def self.z_value_from_right(received_area)
    received_area = received_area.to_f
    corresponding_area = (received_area.abs / 100)

    Ztable.z_score(corresponding_area)
  end

  def self.z_score_given_area(received_area)
    if received_area < 0.5
      right_z_area = 1 - received_area
      z_score = Ztable.z_score(right_z_area)
      z_score * -1
    else
      Ztable.z_score(received_area)
    end
  end

  def self.z_position(std_dev, mean, z_area)
    raise ArgumentError 'Some of the parameters are null' unless [std_dev, mean, z_area].all?

    (z_area * std_dev) + mean
  end

  def self.area_to_paint(intervals, std_dev, mean)
    z_score_values = intervals.map do |interval|
      z_area = z_score_given_area(interval)
      z_position(std_dev, mean, z_area)
    end
    ordered_z_values = z_score_values.sort

    # This index_start is to make the coloring for the front dynamic on Highcharts.js based on the interval parameter
    index_start = ordered_z_values.size - 1

    ordered_z_values.map.with_index(index_start) do |val, index|
      paint_range = if index.even?
                      true
                    else
                      false
                    end
      { value: val,
        color: paint_range }
    end
  end
end
