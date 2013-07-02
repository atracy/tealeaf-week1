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
    @deck = []

    puts 'initialize deck'
    9.times do |i|
      @deck.push Card.new((i + 1).to_s, 'spade', false)
    end


    9.times do |i|
      @deck.push Card.new((i + 1).to_s, 'hearts', false)
    end

    9.times do |i|
      @deck.push Card.new((i + 1).to_s, 'diamonds', false)
    end

    9.times do |i|
      @deck.push Card.new((i + 1).to_s, 'clubs', false)
    end

    @deck.push Card.new('jack', 'clubs', false )
    @deck.push Card.new('queen', 'clubs', false)
    @deck.push Card.new('king', 'clubs', false)
    @deck.push Card.new('Ace', 'clubs', false)

    @deck.push Card.new('jack', 'hearts', false )
    @deck.push Card.new('queen', 'hearts', false)
    @deck.push Card.new('king', 'hearts', false)
    @deck.push Card.new('Ace', 'hearts', false)

    @deck.push Card.new('jack', 'diamonds', false )
    @deck.push Card.new('queen', 'diamonds', false)
    @deck.push Card.new('king', 'diamonds', false)
    @deck.push Card.new('Ace', 'diamonds', false)

    @deck.push Card.new('jack', 'spade', false )
    @deck.push Card.new('queen', 'spade', false)
    @deck.push Card.new('king', 'spade', false)
    @deck.push Card.new('Ace', 'spade', false)

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
