# frozen_string_literal: true

require 'csv'
require 'rails'

# Class responsible to parse CSVs
class CsvParser
  attr_reader :files_path

  def initialize(path)
    @files_path = path
  end

  def parse_file(file_name)
    path = File.join(@files_path, file_name)
    CSV.table(path)
  end

  def to_hash(csv_row)
    csv_row.to_h.stringify_keys
  end

  def to_array_of_hashes(csv_table)
    final_array = []
    csv_table.each do |csv_row|
      final_array << to_hash(csv_row)
    end

    final_array
  end
end
