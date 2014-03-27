require 'sinatra'
require 'sinatra/base'

class UrlShortner < Sinatra::Application
  get '/' do
    "Hello World"
  end
end
