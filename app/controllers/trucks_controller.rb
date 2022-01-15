# frozen_string_literal: true

# Trucks' Controller
class TrucksController < ApplicationController
  before_action :set_truck, only: %i[show update destroy]

  # GET /trucks
  def index
    @trucks = Truck.all

    render json: @trucks
  end

  # GET /trucks/1
  def show
    render json: @truck
  end

  # POST /trucks
  def create
    @truck = Truck.new(truck_params)

    if @truck.save
      render json: @truck, status: :created, location: @truck
    else
      render json: @truck.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trucks/1
  def update
    if @truck.update(truck_params)
      render json: @truck
    else
      render json: @truck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trucks/1
  def destroy
    @truck.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_truck
    @truck = Truck.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def truck_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: %i[driver model])
  end
end
