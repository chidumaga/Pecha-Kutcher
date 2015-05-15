require 'sinatra/base'
require './lib/petchakutcher'

class PechaKutcherWeb < Sinatra::Base

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
    @rand_num = rand(1..8)

    @ashton_quote = ["The scruffier your beard, the sharper you need to dress.", "I can't grow a mustache. It's pretty sad if I attempt to.", "Leapfrog innovation - consistent, constant, ridiculous leapfrog innovation - only happens within a dictatorship.", "The sexiest thing in the entire world is being really smart. And being thoughtful. And being generous. Everything else is crap!", "Oh that's Nikesh. He's the foreign exchange student.", "My eyes! Oh, and I guess my butt too.", "Cartoons make me horny! Oh, and food! and Ruby!", "But I was just amusing myself, you know? And that's the key to life, right? Never stop amusing yourself.", "Whoa-whoa-whoa. No offense, Ptolemy", "This is a lulzy quote.", "No, I’m gonna send a dead hamster up in a balloon.","Relax. Guns don’t just go off by accident.", "Something touched me deep inside the day that Ben...lied", "That's a burn about a burn, that's a second-degree burn.", "Fate. Man, never use a word in a fight if you don't really really know what it means.", "Trust me, they're one bottle of wine away from making out, just like you two.", "There's no text that can replace a loving touch when someone we love is hurting."].sample

    @return_text = @@pechkuch.pick_next
    @@pechkuch.save_participants("pk.txt")
    erb :next
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
