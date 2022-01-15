# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Drivers', type: :request do
  describe 'GET /drivers' do
    context 'when I send the get request with accept header' do
      it 'should return 200' do
        get drivers_path, params: {}, headers: { ACCEPT: 'application/vnd.api+json' }
        expect(response).to have_http_status(200)
      end
    end
  end
end
