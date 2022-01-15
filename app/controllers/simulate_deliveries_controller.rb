# frozen_string_literal: true

# Controller that will receive the data to create the simulation
class SimulateDeliveriesController < ApplicationController
  before_action :set_simulate_delivery, only: %i[show update destroy]

  def simulate_deliveries_list
    @simulate_deliveries = SimulateDelivery.select(:id, :created_at).limit(25).reverse_order.to_a
    final_data = []

    if @simulate_deliveries
      final_data = @simulate_deliveries.map do |current_data|
        { key: current_data.id,
          value: current_data.id,
          text: current_data.created_at.getlocal.to_s[0..-10] }
      end

    end

    render json: { data: final_data }
  end

  # GET /simulate_deliveries/ 1
  def show
    render json: @simulate_delivery
  end

  # POST /simulate_deliveries
  def create
    simulation_params = simulate_delivery_params
    steps = simulation_params.fetch(:steps)

    number_of_samples = simulation_params.fetch(:number_of_samples, 100).to_i
    number_of_simulations = simulation_params.fetch(:number_of_simulations, 5000).to_i
    start_seed_value = simulation_params.fetch(:start_seed_value, 120).to_i
    end_seed_value = simulation_params.fetch(:end_seed_value, 720).to_i
    label = simulation_params.fetch(:label, nil)

    simulations_mean = SimulateDeliveriesHelpers.calculate_mean_for_steps(number_of_simulations, number_of_samples, steps, start_seed_value, end_seed_value)
    simulation_data = SimulateDeliveriesHelpers.simulations_statistical_data(simulations_mean)
    simulation_data[:number_of_samples] = number_of_samples
    simulation_data[:number_of_simulations] = number_of_simulations
    simulation_data[:start_seed_value] = start_seed_value
    simulation_data[:end_seed_value] = end_seed_value

    puts 'simulationData'
    puts simulation_data.inspect

    # TODO: add data field validation before adding to the DB
    @simulate_delivery = SimulateDelivery.new(steps: steps, simulation_data: simulation_data, label: label)

    if @simulate_delivery.save
      render json: @simulate_delivery, status: :created, location: @simulate_deliveries
    else
      render json: @simulate_delivery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /simulate_deliveries/1
  # def destroy
  #  @simulate_delivery.destroy
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_simulate_delivery
    @simulate_delivery = SimulateDelivery.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def simulate_delivery_params
    params.require(:data).permit(:number_of_simulations, :number_of_samples,
                                 :start_seed_value, :end_seed_value, :label,
                                 steps: [:delivery_step, distribution_method: [:name, parameters: %i[id name value uppercase]]]).tap do |inner_params|
      inner_params.require(:number_of_simulations)
      inner_params.require(:number_of_samples)
      inner_params.require(:steps)
    end
  end
end
