# frozen_string_literal: true

# require 'lib/utils/csv_parser'
require_relative '../../../lib/utils/csv_parser'

describe CsvParser do
  let(:csv_parser) do
    described_class.new('spec/fixtures')
  end

  let(:parsed_file) { csv_parser.parse_file('csv_mock.csv') }

  let(:array_of_hashes) do
    csv_parser.to_array_of_hashes(parsed_file)
  end

  shared_examples 'returned hash should have the city' do |received_city_name|
    it "should return an array with a hash having the city #{received_city_name}" do
      selected_hash = array_of_hashes.find do |hash|
        hash['name'] == received_city_name
      end
      searched_city = (selected_hash['name'] if selected_hash)

      expect(searched_city).to eql(received_city_name)
    end
  end

  describe '#parse_file' do
    context 'when I call the method on CsvParser Class' do
      it 'should return a CSV::Table proper headers' do
        expect(parsed_file.headers).to include(:name, :state, :country)
      end

      it 'should return a CSV::Table with 12 rows besides the headers' do
        expect(parsed_file.size).to eql(12)
      end
    end
  end

  describe '#to_hash' do
    context 'when I call the method passing a CSV::Row successfully' do
      it 'should return a hash including the proper keys' do
        expect(csv_parser.to_hash(parsed_file[1])).to include('name',
                                                              'state',
                                                              'country')
      end

      it 'should return a hash with the expected value for row 1' do
        expected_hash = { 'name' => 'Abadia dos Dourados',
                          'state' => 'MG',
                          'country' => 'BR' }
        expect(csv_parser.to_hash(parsed_file[1])).to eql(expected_hash)
      end
    end
  end

  describe '#to_array_of_hashes' do
    context 'when I call the method passing the parsed file successfully' do
      it 'should return an array with 12 elements' do
        expect(array_of_hashes.size).to eql(12)
      end

      include_examples 'returned hash should have the city', 'Abadia de Goiás'
      include_examples 'returned hash should have the city', 'Abadia dos Dourados'
      include_examples 'returned hash should have the city', 'Abadiânia'
      include_examples 'returned hash should have the city', 'Açailândia'
      include_examples 'returned hash should have the city', 'Acará'
      include_examples 'returned hash should have the city', 'Acaraú'
      include_examples 'returned hash should have the city', 'Acauã'
      include_examples 'returned hash should have the city', 'Aceguá'
      include_examples 'returned hash should have the city', 'Acrelândia'
      include_examples 'returned hash should have the city', 'Acreúna'
      include_examples 'returned hash should have the city', 'Açu'
      include_examples 'returned hash should have the city', 'Aguaí'
    end
  end
  # TODO: Improve code add the fails cases / errors handling
end
