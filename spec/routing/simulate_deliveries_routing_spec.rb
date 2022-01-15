# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SimulateDeliveriesController, type: :routing do
  describe 'routing' do
    # it "routes to #index" do
    #  expect(:get => "/simulate_deliveries").to route_to("simulate_deliveries#index")
    # end

    # it "routes to #show" do
    #  expect(:get => "/simulate_deliveries/1").to route_to("simulate_deliveries#show", :id => "1")
    # end

    it 'routes to #create' do
      expect(post: '/simulate_deliveries').to route_to('simulate_deliveries#create')
    end
    #
    # it "routes to #update via PUT" do
    #  expect(:put => "/simulate_deliveries/1").to route_to("simulate_deliveries#update", :id => "1")
    # end
    #
    # it "routes to #update via PATCH" do
    #  expect(:patch => "/simulate_deliveries/1").to route_to("simulate_deliveries#update", :id => "1")
    # end
    #
    # it "routes to #destroy" do
    #  expect(:delete => "/simulate_deliveries/1").to route_to("simulate_deliveries#destroy", :id => "1")
    # end
  end
end
