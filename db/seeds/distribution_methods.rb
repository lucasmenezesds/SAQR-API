require 'utils/csv_parser'
require 'utils/seeds_utils'
require 'activerecord-import'


csv_parser = CsvParser.new(Rails.root)

puts '#### [START] Distribution Methods Populator ####'

if DistributionMethod.count == 0
  distributions_methods = csv_parser.to_array_of_hashes(csv_parser.parse_file('db/data/distributions_methods.csv'))

  DistributionMethod.import distributions_methods

  puts '[DONE] - Populating Distributions Methods Table'
else
  puts '[NOTE] - Distributions Methods Table was already populated!'
end

if DistributionParameter.count == 0
  distributions_params = csv_parser.to_array_of_hashes(csv_parser.parse_file('db/data/distributions_parameters.csv'))

  DistributionParameter.import distributions_params

  puts '[DONE] - Populating Distributions Parameters Table'
else
  puts '[NOTE] - Distributions Parameters Table was already populated!'
end

if DistributionMethodsParameter.count == 0
  distributions_methods_params = csv_parser.to_array_of_hashes(csv_parser.parse_file('db/data/distributions_methods_parameters.csv'))

  distrib_methods = DistributionMethod.all
  distrib_params  = DistributionParameter.all

  data_to_import = SeedsUtils.process_methods_parameters(distributions_methods_params, distrib_methods, distrib_params)

  DistributionMethodsParameter.import data_to_import

  puts '[DONE] - Populating Distributions Parameters Table'
else
  puts '[NOTE] - Distributions Parameters Table was already populated!'
end

puts '#### [DONE] Distribution Methods Populator ####'