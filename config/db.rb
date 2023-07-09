require 'yaml'
require 'sinatra/activerecord'
require './config/env'


db_config = YAML.load_file('./config/database.yml')

ActiveRecord::Base.configurations = db_config
ActiveRecord::Base.establish_connection ENV['APP_ENV'].to_sym
