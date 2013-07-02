require 'pry'

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

  def setused(state)
    @used = state
  end

end
# Deck Class
class Deck
  def initialize
    @deck = []

    puts 'initialize deck'
    9.times do |i|
      @deck.push Card.new((i + 1).to_s, 'spades', false)
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

    @deck.push Card.new('jack', 'spades', false )
    @deck.push Card.new('queen', 'spades', false)
    @deck.push Card.new('king', 'spades', false)
    @deck.push Card.new('Ace', 'spades', false)

  end

  def shuffle
    @deck.shuffle!
    @deck.shuffle!
  end

  def getcard

    @deck.each do |d|
      if d.isused == false

        d.setused true
        return d
        break

      end
    end

  end

end
# Person Class
class Person

  def initialize(personname)
    @name = personname
    @points = 0
    @cards = []
  end

  def getname
    return @name
  end

  def getcard(anothercard)
    @cards.push anothercard
    if anothercard.getpoints == 'jack'||
      anothercard.getpoints == 'queen' ||
      anothercard.getpoints == 'king'
    @points = @points.to_i + 10
  elsif anothercard.getpoints == 'Ace'
    if @points > 21
      @points = @points + 1
    elsif (@points + 11) > 21
      @points = @points + 1
    else
      @points = @points + 11
    end
  else
    @points = @points.to_i + anothercard.getpoints.to_i
    end
  end

  def getpoints
    return @points
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
    card2 = @deck.getcard
    puts "You got the #{card1.getpoints} of #{card1.getsuite}"
    puts "you also got the #{card2.getpoints} of #{card2.getsuite}"
    player.getcard card1
    player.getcard card2
    anothercard? = 'y'
    while anothercard == 'y'
      puts "you now have #{player.getpoints} do you want another card? (y/n)"
      anothercard? = gets.chomp!
      if anothercard? == 'y'

      end
    #card2 = @deck.getcard
    #puts "Hi #{player.name}!  Your cards are #{card1.suite} #{card1.points}
 #{card2.suite} #{card2.points}"
  end

end

bj = Blackjack.new
bj.play
