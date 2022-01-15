# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BellChartDataController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'POST #create' do
    context 'with valid params' do
      # TODO: Implement populator for this endpoint
      # it 'should renders a JSON response with the a SimulateDeliveries info and other data' do
      #  post :create, params: { bell_chart_datum: valid_attributes }, session: valid_session
      #  expect(response).to have_http_status(:created)
      #  expect(response.content_type).to eq('application/json')
      #  expect(response.location).to eq(bell_chart_datum_url(BellChartDatum.last))
      # end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new bell_chart_datum' do
        post :create, params: { bell_chart_datum: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
