require 'sinatra/base'
require './lib/petchakutcher'

class Pecha_Kutcher < Sinatra::Base
  get '/' do
    @@pechkuch = PetchaKutcher.new
    erb :index
  end

  post '/' do
    @name = params[:name]
    @@pechkuch.add_participant params[:name], params[:subject]
    erb :index
  end

  get '/next' do
    @return_text = @@pechkuch.pick_next
    erb :next
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
