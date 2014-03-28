require 'sinatra'
require 'sinatra/base'

class UrlShortener < Sinatra::Application
  URL = []

  get '/' do
    erb :index
  end

  post '/' do
    URL << params[:old_url]
    puts URL
    redirect '/show'
  end

  get '/show' do
    erb :show
  end

end



