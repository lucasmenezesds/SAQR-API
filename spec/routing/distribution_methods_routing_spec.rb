# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DistributionMethodsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/distribution_methods').to route_to('distribution_methods#index')
    end

    # it 'routes to #show' do
    #  expect(get: '/distribution_methods/1').to route_to('distribution_methods#show', id: '1')
    # end
    #
    # it 'routes to #create' do
    #  expect(post: '/distribution_methods').to route_to('distribution_methods#create')
    # end
    #
    # it 'routes to #update via PUT' do
    #  expect(put: '/distribution_methods/1').to route_to('distribution_methods#update', id: '1')
    # end
    #
    # it 'routes to #update via PATCH' do
    #  expect(patch: '/distribution_methods/1').to route_to('distribution_methods#update', id: '1')
    # end
    #
    # it 'routes to #destroy' do
    #  expect(delete: '/distribution_methods/1').to route_to('distribution_methods#destroy', id: '1')
    # end
  end
end
