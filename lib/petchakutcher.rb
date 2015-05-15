class Talk

  def initialize host, subject
    @host, @subject = format(host), format(subject)
  end

  attr_reader :host, :subject

  def format word
    word.downcase.capitalize
  end

end

class PetchaKutcher

  def initialize
    @talks = []
  end

  def add_participant name, subject
    @talks << (Talk.new(name, subject))
  end

  def list_participants
    p self
  end


  def save_participants(filename)
    txt = open(filename,'w')
    @talks.each { |talk|  txt.write("#{talk.host}%#{talk.subject}\n") }
    txt.close
  end


  def load_participants(filename)
    if File.file?(filename)
      txt = open(filename)
      while !txt.eof?
        a, b = txt.readline.split("%")
        b.chomp!
        @talks << Talk.new(a, b)
      end
    end
  end

  #returns one string of whos up next
  def pick_next
    if @talks.count == 0
      "No more entrants"
    else
      talk1 = @talks.shuffle!.pop
      interesting = ["interesting","boring","enlightening","absorbing","fascinating","gripping","compulsive","mind numbing"].sample
      description = ["delectable","mighty","sexy","impressive","lazy","wistful"].sample
      talking = ["talking","whaffling on","preaching on","prattling on","jabbering on ","bleating on"].sample
      "Up next we have the #{description} #{talk1.host} #{talking} about the very #{interesting} subject of #{talk1.subject}."
    end
  end

end