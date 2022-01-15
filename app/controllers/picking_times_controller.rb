# frozen_string_literal: true

# PickingTimes' Controller
class PickingTimesController < ApplicationController
  before_action :set_picking_time, only: %i[show update destroy]

  # GET /picking_times
  def index
    @picking_times = PickingTime.all

    render json: @picking_times
  end

  # GET /picking_times/1
  def show
    render json: @picking_time, include: [:delivery]
  end

  # POST /picking_times
  def create
    @picking_time = PickingTime.new(picking_time_params)

    if @picking_time.save
      render json: @picking_time, status: :created, location: @picking_time
    else
      render json: @picking_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /picking_times/1
  def update
    if @picking_time.update(picking_time_params)
      render json: @picking_time
    else
      render json: @picking_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /picking_times/1
  def destroy
    @picking_time.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_picking_time
    @picking_time = PickingTime.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def picking_time_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params,
                                                          only: %i[duration_time start_time
                                                                   number_of_items number_of_items_type picking_date])
  end
end
