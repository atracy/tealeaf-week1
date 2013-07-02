# Card Class
class Card
  def initialize(pnts, suit, isused)
    @used = false
    @points = pnts
    @suite = suit
    @used = isused
  end

  def getpoints
    return @points
  end

  def getsuite
    return @suite
  end

  def isused
    return @used
  end


end
# Deck Class
class Deck
  def initialize

    puts 'generate cards and put them in an array'
    @deck = [Card.new(1, 'spade', false), Card.new(2, 'spade', false)]
  end

  def shuffle
    @deck.shuffle
    @deck.shuffle
    puts 'deck shuffled'
  end

  def getcard
    puts "there are #{@deck.count} cards in the deck"
    @deck.each do |d|
      puts "points: #{d.getpoints}"
      puts "Suite: #{d.getsuite}"
      puts "Is Used: #{d.isused}"
    end
    @deck.select { |a| puts "#{a.getpoints} #{a.isused} #{a.getsuite}" if 1 == 1 }
    return @deck[0]
  end

end
# Person Class
class Person

  def initialize(personname)
    @name = personname
    @points = 0
  end

  def getname
    return @name
  end
  def wantcard?(val)

  end

  def getcard(anothercard)
    @points = anothercard.getpoints
    puts "#{@name} you currently have #{@points}"
  end
end
# Blackjack Class
class Blackjack
  def initialize
    print 'Hi!  Welcome to Blackjack!'
    @deck = Deck.new
  end

  def play
    print '  What''s your name? '

    #name = gets.chomp!
    name = 'Aaron'
    player = Person.new name
    dealer = Person.new 'dealer'
    puts "the #{dealer.getname} is shuffling the cards"
    @deck.shuffle
    puts "The #{dealer.getname} is dealing the cards"
    card1 = @deck.getcard
    puts "your current card has #{card1.getpoints} points"
    player.getcard card1
    #card2 = @deck.getcard
    #puts "Hi #{player.name}!  Your cards are #{card1.suite} #{card1.points}
 #{card2.suite} #{card2.points}"
  end

end

bj = Blackjack.new
bj.play
