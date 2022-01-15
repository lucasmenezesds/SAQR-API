# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransportationTimesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/transportation_times').to route_to('transportation_times#index')
    end

    it 'routes to #show' do
      expect(get: '/transportation_times/1').to route_to('transportation_times#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/transportation_times').to route_to('transportation_times#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/transportation_times/1').to route_to('transportation_times#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/transportation_times/1').to route_to('transportation_times#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/transportation_times/1').to route_to('transportation_times#destroy', id: '1')
    end
  end
end
