# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PickingTimesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/picking_times').to route_to('picking_times#index')
    end

    it 'routes to #show' do
      expect(get: '/picking_times/1').to route_to('picking_times#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/picking_times').to route_to('picking_times#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/picking_times/1').to route_to('picking_times#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/picking_times/1').to route_to('picking_times#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/picking_times/1').to route_to('picking_times#destroy', id: '1')
    end
  end
end
