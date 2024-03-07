require 'active_record'

# Load the database configuration from database.yml
ActiveRecord::Base.establish_connection(YAML.load_file('database.yml')[ENV['RACK_ENV'] || 'development'])

