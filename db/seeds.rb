# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

SEEDS_LOCATION = File.join(Rails.root, 'db', 'seeds').freeze

def load_seed(seed_name)
  puts "Loading -> #{seed_name}"
  load File.join(SEEDS_LOCATION, "#{seed_name}.rb")
  puts "Loaded -> #{seed_name}"
end


load_seed 'city'
load_seed 'db_generator'
load_seed 'distribution_methods'

