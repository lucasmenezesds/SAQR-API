# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BellChartDataController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/bell_chart_data').to route_to('bell_chart_data#create')
    end
  end
end
