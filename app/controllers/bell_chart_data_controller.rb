# frozen_string_literal: true

# require 'lib/statistical_libs/statistical_functions/normal_distribution_functions'
require_relative '../../lib/statistical_libs/statistical_functions/normal_distribution_functions'

# BellChartDataController that will return SimulateDelivery Object with other information
class BellChartDataController < ApplicationController
  include NormalDistributionFunctions
  # before_action :set_bell_chart_datum, only: %i[show update destroy]

  # FIXME: not the best thing to do, but..
  # POST /bell_chart_data
  def create
    params = bell_chart_datum_params
    simulation_id = params.fetch('simulation-id')
    alpha_value = params.fetch('alpha-value', 95).to_f / 100

    intervals = []
    intervals << params.dig(:"interval-option", :values, :from).to_f
    to_value = params.dig(:"interval-option", :values, :to)
    intervals << (to_value.to_f) unless to_value.nil?

    @bell_chart_data = SimulateDelivery.find(simulation_id)

    final_payload = @bell_chart_data['simulation_data']

    zones = NormalDistributionFunctions.area_to_paint(intervals, final_payload['std_dev'], final_payload['mean'])
    mean_intervals = NormalDistributionFunctions.confidence_interval_for_mean(final_payload['data_size'],
                                                                              final_payload['mean'],
                                                                              final_payload['std_dev'],
                                                                              alpha_value)

    final_payload['probabilities'] = { 'success' => 0, 'failure' => 0 }

    sucess_rate, failure_rate = NormalDistributionFunctions.intervals_probability(intervals, final_payload['std_dev'], final_payload['mean'])

    if sucess_rate && failure_rate
      final_payload['probabilities']['success'] = sucess_rate
      final_payload['probabilities']['failure'] = failure_rate
    end

    final_payload['zones'] = zones
    final_payload['mean_intervals'] = mean_intervals

    if @bell_chart_data
      render json: { data: final_payload }, status: :created, location: @bell_chart_data, adapter: :attributes
    else
      render json: @bell_chart_data.errors, status: :unprocessable_entity
    end
  end

  private

  ## Use callbacks to share common setup or constraints between actions.
  # def set_bell_chart_datum
  #  @bell_chart_data = SimulateDelivery.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def bell_chart_datum_params
    params.require(:data).permit('simulation-id', 'interval-option', 'alpha-value',
                                 "interval-option": [:option, values: %i[from to]])
  end
end
