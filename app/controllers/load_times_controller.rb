# frozen_string_literal: true

# LoadTimes' Controller
class LoadTimesController < ApplicationController
  before_action :set_load_time, only: %i[show update destroy]

  # GET /load_times
  def index
    @load_times = LoadTime.all

    render json: @load_times
  end

  # GET /load_times/1
  def show
    render json: @load_time, include: [:delivery]
  end

  # POST /load_times
  def create
    @load_time = LoadTime.new(load_time_params)

    if @load_time.save
      render json: @load_time, status: :created, location: @load_time
    else
      render json: @load_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /load_times/1
  def update
    if @load_time.update(load_time_params)
      render json: @load_time
    else
      render json: @load_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /load_times/1
  def destroy
    @load_time.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_load_time
    @load_time = LoadTime.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def load_time_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: %i[duration_time event start_time load_date])
  end
end
