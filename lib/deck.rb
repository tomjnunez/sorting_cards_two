require './lib/guess'
require './lib/card'

class Deck
attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def sort
    loop do
      sorted_cards = false
      (count-1).times do |sort|
        if cards[sort].combined_card_worth > cards[sort+1].combined_card_worth
          cards[sort], cards[sort+1] = cards[sort+1], cards[sort]
          sorted_cards = true
        end
      end
      break if sorted_cards == false
    end
    return cards
  end
end
