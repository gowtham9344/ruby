require 'active_record'

# Load the database configuration from database.yml
ActiveRecord::Base.establish_connection(YAML.load_file('database.yml')[ENV['RACK_ENV'] || 'development'])

class User < ActiveRecord::Base
end


# db/migrate/create_users.rb
class CreateUsers < ActiveRecord::Migration[6.0]
    def change
      create_table :users do |t|
        t.string :name
        t.string :email
        t.timestamps
      end
    end
end
