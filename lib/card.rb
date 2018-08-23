class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def card_worth
    card_worth = {"2" => 2,
                  "3" => 3,
                  "4" => 4,
                  "5" => 5,
                  "6" => 6,
                  "7" => 7,
                  "8" => 8,
                  "9" => 9,
                  "10" => 10,
                  "Jack" => 11,
                  "Queen" => 12,
                  "King" => 13,
                  "Ace" => 14}
  end

  def suit_worth
    suit_worth = {"Clubs" => 0.1,
    "Diamonds" => 0.2,
    "Hearts" => 0.3,
    "Spades" => 0.4}
  end

  def combined_card_worth
    card_worth[value] + suit_worth[suit]
  end
end
