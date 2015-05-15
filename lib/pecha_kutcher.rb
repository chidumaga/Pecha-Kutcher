require 'sinatra/base'
require './lib/petchakutcher'

class Pecha_Kutcher < Sinatra::Base

  set :public_folder, Proc.new { File.join('..','public') }
  puts File.join(root, public_folder)

  get '/' do
    @@pechkuch = PetchaKutcher.new
    @@pechkuch.load_participants("pk.txt")
    erb :index
  end

  post '/' do
    @name = params[:name]
    @@pechkuch.add_participant params[:name], params[:subject]
    @@pechkuch.save_participants("pk.txt")
    erb :index
  end

  get '/next' do
    @rand_num = rand(1..10)
    @return_text = @@pechkuch.pick_next
    @@pechkuch.save_participants("pk.txt")
    erb :next
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
