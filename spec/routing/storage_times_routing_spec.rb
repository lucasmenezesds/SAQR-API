# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StorageTimesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/storage_times').to route_to('storage_times#index')
    end

    it 'routes to #show' do
      expect(get: '/storage_times/1').to route_to('storage_times#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/storage_times').to route_to('storage_times#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/storage_times/1').to route_to('storage_times#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/storage_times/1').to route_to('storage_times#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/storage_times/1').to route_to('storage_times#destroy', id: '1')
    end
  end
end
