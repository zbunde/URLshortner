require 'sinatra/base'
require 'sinatra/flash'
require 'uri'

class UrlShortener < Sinatra::Application
  URL = []
  SHORTENED_URL = "http://wwww.example.com/"

  enable :sessions

  get '/' do
    id = URL.length+ 1
    erb :index, :locals => {:id => id}
  end

  post '/:id' do
    id = URL.length + 1
    original_url = params[:original]
    #url = Validation.is_url?(original_url)
    #valid_input = Validation.is_empty?(original_url)
    if original_url.strip.empty?
      flash[:error] = "URL cannot be blank"
      redirect "/"
    elsif
      original_url =~ URI::regexp
      URL << original_url
      redirect "#{id}?stats=true"
    elsif
      flash[:error] = "This is not a valid URL"
      redirect "/"
    end
  end

  get '/:id' do
    stats = params[:stats]
    id = params[:id]
    new_url = SHORTENED_URL + id
    old_url = URL[id.to_i - 1]
    if stats
      erb :show, :locals => {:id => id, :original => old_url, :new_url => new_url}
    else
      redirect "#{old_url}"
    end
  end
end
