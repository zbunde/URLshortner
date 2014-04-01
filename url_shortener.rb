require 'sinatra/base'

class UrlShortener < Sinatra::Application
  URL = []
  SHORTENED_URL = "http://wwww.example.com/"

  get '/' do
    id = URL.length+ 1
    erb :index, :locals => {:id => id}
  end

  get '/show' do
    erb :show, :locals => {:original => URL, :new_url => SHORTENED_URL}
  end

  post '/show' do
    id = URL.length + 1
    URL << params[:original]
    redirect "/show/#{id}"
  end

  get '/show/:id' do
    id = params[:id]
    new_url = SHORTENED_URL + id
    old_url = URL[id.to_i - 1]
    erb :show, :locals => {:id => id, :original => old_url, :new_url => new_url}
  end
end
