# frozen_string_literal: true

# StorageTimes' Controller
class StorageTimesController < ApplicationController
  before_action :set_storage_time, only: %i[show update destroy]

  # GET /storage_times
  def index
    @storage_times = StorageTime.all

    render json: @storage_times
  end

  # GET /storage_times/1
  def show
    render json: @storage_time, include: [:delivery]
  end

  # POST /storage_times
  def create
    @storage_time = StorageTime.new(storage_time_params)

    if @storage_time.save
      render json: @storage_time, status: :created, location: @storage_time
    else
      render json: @storage_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /storage_times/1
  def update
    if @storage_time.update(storage_time_params)
      render json: @storage_time
    else
      render json: @storage_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /storage_times/1
  def destroy
    @storage_time.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_storage_time
    @storage_time = StorageTime.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def storage_time_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: %i[duration_time event start_time storage_date])
  end
end
