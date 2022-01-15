source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.7'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# ActiveModel::Serializers allows you to generate your JSON in an object-oriented and convention-driven manner.
gem 'active_model_serializers', '~> 0.10.7'

# A plugin for versioning Rails based RESTful APIs.
gem 'versionist', '~> 1.7'

### Statistical Gems ###
# Numo::NArray - New NArray class library in Ruby/Numo.
gem 'numo-narray', '~> 0.9.1.3'
# GSL interface for Ruby/Numo::NArray
gem 'numo-gsl', '~> 0.1.2'

gem 'rb-gsl', '~> 1.16', '>= 1.16.0.6'

gem 'distribution', '~> 0.7.3'
gem 'statsample', '~> 2.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Loads environment variables from `.env.development`.
  gem 'dotenv', '~> 2.2', '>= 2.2.1'

  # rspec-rails is a testing framework for Rails 3.x, 4.x and 5.0.
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  # A library for setting up Ruby objects as test data
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  # A library for generating fake data such as names, addresses, and phone numbers.
  gem 'faker', '~> 1.8', '>= 1.8.7'

  gem 'pry-rails', '~> 0.3.6'
  gem 'simplecov', require: false

  gem 'activerecord-import', '~> 0.23.0'
end

group :development do
  gem 'better_errors', '~> 2.5'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard-rspec', require: false
  gem 'rubycritic', require: false
  gem 'rubocop', '~> 0.77.0'
  gem 'spreadsheet', '~>1.1.1', require: false
  gem 'mechanize', '~>2.7.5', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
