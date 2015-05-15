class Participant

  def initialize name, subject
    @name = name.downcase
    @name[0] = @name[0].capitalize
    @subject = subject.downcase
    @subject[0] = @subject[0].capitalize
  end

attr_accessor :name
attr_accessor :subject #why are these attr_accessors

end

class PetchaKutcher

  def initialize
    @pk = []
  end


  def add_participant name, subject
    particiant1 = Participant.new name, subject
    @pk << particiant1
    @pk.shuffle!
  end


  def list_participants
    p self
  end


  def save_participants(filename)
    txt = open(filename,'w')
    @pk.each { |particiant1|  txt.write("#{particiant1.name}%#{particiant1.subject}\n") }
    txt.close
  end


  def load_participants(filename)
    if File.file?(filename)
      txt = open(filename)
      while !txt.eof?
        a, b = txt.readline.split("%")
        #b = b[0..-3]  #get rid of new line chars
        b.chomp!
        particiant1 = Participant.new a, b
        @pk << particiant1
      end
      @pk.shuffle
    end
  end


  #returns one string of whos up next
  def pick_next
    if @pk.count == 0
      "No more entrants"
    else
      particiant1 = @pk.pop
      interesting = ["interesting","boring","enlightening","absorbing","fascinating","gripping","compulsive","mind numbing"].shuffle.last
      person = ["delectable","mighty","sexy","impressive","lazy","wistful"].shuffle.last
      talking = ["talking","whaffling on","preaching on","prattling on","jabbering on ","bleating on"].shuffle.last
      "Up next we have the #{person} #{particiant1.name} #{talking} about the very #{interesting} subject of #{particiant1.subject}."
    end
  end

end


pk1 = PetchaKutcher.new
# pk1.add_participant("tem","lewisham")
# pk1.add_participant("ptolemy","bubbles")
# pk1.add_participant("chedu","shirts")

# # #pk1.list_participants
# pk1.save_participants("pk.txt")

# pk1.load_participants("pk.txt")

# p pk1.pick_next
# p pk1.pick_next
# p pk1.pick_next
# p pk1.pick_next