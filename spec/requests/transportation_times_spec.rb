# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TransportationTimes', type: :request do
  describe 'GET /transportation_times' do
    it 'works! (now write some real specs)' do
      get transportation_times_path, params: {}, headers: { ACCEPT: 'application/vnd.api+json' }
      expect(response).to have_http_status(200)
    end
  end
end
