require 'seed_generator/db_seed_generator'

puts '[START] Seed Generator'


if Rails.env == 'test'
  number_of_cities = 2
  number_of_deliveries = 10
else
  number_of_cities = 30
  number_of_deliveries = 50
end

seed_generator = DbSeedGenerator.new(number_of_cities, 100, number_of_deliveries)
seed_generator.populate

puts '[DONE] Seed Generator'
