# frozen_string_literal: true

# TransportationTimes' Controller
class TransportationTimesController < ApplicationController
  before_action :set_transportation_time, only: %i[show update destroy]

  # GET /transportation_times
  def index
    @transportation_times = TransportationTime.all

    render json: @transportation_times
  end

  # GET /transportation_times/1
  def show
    render json: @transportation_time, include: %i[delivery destination_city origin_city]
  end

  # POST /transportation_times
  def create
    @transportation_time = TransportationTime.new(transportation_time_params)

    if @transportation_time.save
      render json: @transportation_time, status: :created, location: @transportation_time
    else
      render json: @transportation_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transportation_times/1
  def update
    if @transportation_time.update(transportation_time_params)
      render json: @transportation_time
    else
      render json: @transportation_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transportation_times/1
  def destroy
    @transportation_time.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transportation_time
    @transportation_time = TransportationTime.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def transportation_time_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params,
                                                          only: %i[duration_time event
                                                                   transportation_date
                                                                   origin_city destination_city])
  end
end
