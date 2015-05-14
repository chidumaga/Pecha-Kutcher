require 'sinatra/base'

class Pecha_Kutcher < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @name = params[:name]
    erb :index
  end

  get '/next' do
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
