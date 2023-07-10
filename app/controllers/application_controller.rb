require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './config/env'
require './app/models/user'


class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV['SESSION_SECRET']
    set :method_override, true
    register Sinatra::ActiveRecordExtension
  end

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :welcome, :layout => :layout
  end

  not_found do
    erb :"404", :layout => :layout
  end

  private

  def current_user
    User.find_by_id(session[:id])
  end

  def logged_in?
    !!current_user
  end
end
