# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  describe 'GET /cities/1' do
    context 'when I send the get request with accept header' do
      it 'should return 200' do
        get "#{cities_path}/1", params: {}, headers: { ACCEPT: 'application/vnd.api+json' }
        expect(response).to have_http_status(200)
      end
    end
  end
end
