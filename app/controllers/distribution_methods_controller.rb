# frozen_string_literal: true

# Class that will list the RNG Methods
class DistributionMethodsController < ApplicationController
  before_action :set_distribution_method, only: %i[show update destroy]

  # GET /distribution_methods
  def index
    @distribution_methods = DistributionMethod.all

    render json: { data: ActiveModelSerializers::SerializableResource.new(@distribution_methods, adapter: :attributes) }
  end

  ## GET /distribution_methods/1
  # def show
  #  render json: @distribution_method
  # end
  #
  ## POST /distribution_methods
  # def create
  #  @distribution_method = DistributionMethod.new(distribution_method_params)
  #
  #  if @distribution_method.save
  #    render json: @distribution_method, status: :created, location: @distribution_method
  #  else
  #    render json: @distribution_method.errors, status: :unprocessable_entity
  #  end
  # end
  #
  ## PATCH/PUT /distribution_methods/1
  # def update
  #  if @distribution_method.update(distribution_method_params)
  #    render json: @distribution_method
  #  else
  #    render json: @distribution_method.errors, status: :unprocessable_entity
  #  end
  # end
  #
  ## DELETE /distribution_methods/1
  # def destroy
  #  @distribution_method.destroy
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_distribution_method
    @distribution_method = DistributionMethod.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def distribution_method_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: %i[name short_name])
    # params.require(:distribution_method).permit(:name, :short_name)
  end
end
