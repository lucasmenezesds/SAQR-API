# frozen_string_literal: true

# Deliveries' Controller
class DeliveriesController < ApplicationController
  before_action :set_delivery, only: %i[show update destroy]

  # GET /deliveries
  def index
    @deliveries = Delivery.all

    render json: @deliveries
  end

  # GET /deliveries/1
  def show
    render json: @delivery, include: %i[picking_time load_time transportation_time receive_time storage_time cargos]
  end

  # POST /deliveries
  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      render json: @delivery, status: :created, location: @delivery
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deliveries/1
  def update
    if @delivery.update(delivery_params)
      render json: @delivery
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deliveries/1
  def destroy
    @delivery.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def delivery_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params,
                                                          only: %i[picking_time load_time
                                                                   transportation_time receive_time
                                                                   storage_time delivery_date])
  end
end
