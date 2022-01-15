# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReceiveTimesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/receive_times').to route_to('receive_times#index')
    end

    it 'routes to #show' do
      expect(get: '/receive_times/1').to route_to('receive_times#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/receive_times').to route_to('receive_times#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/receive_times/1').to route_to('receive_times#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/receive_times/1').to route_to('receive_times#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/receive_times/1').to route_to('receive_times#destroy', id: '1')
    end
  end
end
