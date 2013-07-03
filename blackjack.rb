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

    j = 0

    9.times do
      j += 1
      @deck.push Card.new((j + 1).to_s, 'spades', false)
      @deck.push Card.new((j + 1).to_s, 'hearts', false)
      @deck.push Card.new((j + 1).to_s, 'diamonds', false)
      @deck.push Card.new((j + 1).to_s, 'clubs', false)
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
    @haveace = false
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
    #binding.pry
  elsif anothercard.getpoints == 'Ace'
    @haveace = true
  else
    @points = @points.to_i + anothercard.getpoints.to_i
    end
  end

  def getpoints
    if @haveace == true
      if @points > 21
        temppoints = @points + 1
      elsif (@points + 11) > 21
        temppoints = @points + 1
      else
        temppoints = @points + 11
      end
      return temppoints
    else
      return @points
    end
  end
end

@deck = Deck.new

print 'Hi! Welcome to Blackjack!  What''s your name? '

name = gets.chomp!

player = Person.new name
dealer = Person.new 'dealer'

puts "the #{dealer.getname} is shuffling the cards"

@deck.shuffle

puts "The #{dealer.getname} is dealing the cards"

card1 = @deck.getcard
dcard1 = @deck.getcard
card2 = @deck.getcard
dcard2 = @deck.getcard

puts "You got the #{card1.getpoints} of #{card1.getsuite}"
puts "you also got the #{card2.getpoints} of #{card2.getsuite}"

puts "Dealer has the #{dcard1.getpoints} of #{dcard1.getsuite}"
puts "Dealer has the #{dcard2.getpoints} of #{dcard2.getsuite}"

player.getcard card1
puts "Gave player #{card1.getpoints} player thinks he has #{player.getpoints} points"

dealer.getcard dcard1
puts "Gave dealer #{dcard1.getpoints} player thinks he has #{dealer.getpoints} points"

player.getcard card2
puts "Gave player #{card2.getpoints} player thinks he has #{player.getpoints} points"

dealer.getcard dcard2
puts "Gave dealer #{dcard2.getpoints} player thinks he has #{dealer.getpoints} points"


anothercard = 'y'

while anothercard == 'y'

  puts "you now have #{player.getpoints} points do you want another card? (y/n)"
  anothercard = gets.chomp!

  if anothercard == 'y'

    curcard = @deck.getcard
    player.getcard curcard
    puts "The dealer hands you a card"
    puts "you turn it over and find it's the #{curcard.getpoints} of #{curcard.getsuite}"

    if player.getpoints > 21

      puts "You went over 21 with #{player.getpoints} points"
      break

    end
  end
end

puts 'The dealer turns over his cards'
puts "He has a #{dcard1.getpoints} of #{dcard1.getsuite}"
puts "He has a #{dcard2.getpoints} of #{dcard2.getsuite}"

while dealer.getpoints <= 17

  puts "he then grabs a card from the deck for himself"
  curcard = @deck.getcard
  dealer.getcard @deck.getcard
  puts "he draws a #{curcard.getpoints} of #{curcard.getsuite} for a total of #{dealer.getpoints} points"
  #binding.pry
end

puts "dealer has #{dealer.getpoints} and you have #{player.getpoints}"

if dealer.getpoints > 21 && player.getpoints > 21

  puts 'A Bust!  Both were over!'

elsif  dealer.getpoints == player.getpoints

  puts 'It was a tie! No one wins'

elsif (player.getpoints > dealer.getpoints && player.getpoints < 21) ||
  (dealer.getpoints > 21 && player.getpoints < 21)

  puts "Congratulations #{player.getname}!!!!  You win!!!!!"

else

  puts "Sorry #{player.getname}, You Lose!"
end

