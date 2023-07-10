require './app/controllers/application_controller'
require './app/models/user'

class SessionController < ApplicationController
  get '/login' do
    erb :'session/new'
  end

  post '/login' do
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect '/'
    else
      @error = "Incorrect email or password"
      erb :'/session/new'
    end
  end
end
