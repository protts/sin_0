require './app/controllers/application_controller'
require './app/controllers/session_controller'

map('/') { run ApplicationController }
map('/') { run SessionController }
