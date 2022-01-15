# frozen_string_literal: true

# ReceiveTimes' Controller
class ReceiveTimesController < ApplicationController
  before_action :set_receive_time, only: %i[show update destroy]

  # GET /receive_times
  def index
    @receive_times = ReceiveTime.all

    render json: @receive_times
  end

  # GET /receive_times/1
  def show
    render json: @receive_time, include: [:delivery]
  end

  # POST /receive_times
  def create
    @receive_time = ReceiveTime.new(receive_time_params)

    if @receive_time.save
      render json: @receive_time, status: :created, location: @receive_time
    else
      render json: @receive_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /receive_times/1
  def update
    if @receive_time.update(receive_time_params)
      render json: @receive_time
    else
      render json: @receive_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /receive_times/1
  def destroy
    @receive_time.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_receive_time
    @receive_time = ReceiveTime.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def receive_time_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params,
                                                          only: %i[duration_time start_time event received_date])
  end
end
