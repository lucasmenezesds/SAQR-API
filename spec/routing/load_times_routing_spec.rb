# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoadTimesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/load_times').to route_to('load_times#index')
    end

    it 'routes to #show' do
      expect(get: '/load_times/1').to route_to('load_times#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/load_times').to route_to('load_times#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/load_times/1').to route_to('load_times#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/load_times/1').to route_to('load_times#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/load_times/1').to route_to('load_times#destroy', id: '1')
    end
  end
end
