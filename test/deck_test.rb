require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
      @card_1 = Card.new('3', 'Hearts')
      @card_2 = Card.new('4', 'Clubs')
      @card_3 = Card.new('5', 'Diamonds')
    end

  def test_it_exists
  deck = Deck.new([@card_1, @card_2, @card_3])

  assert_instance_of Deck, deck
  end

  def test_it_has_cards
    deck = Deck.new([@card_1, @card_2, @card_3])

    assert_equal [@card_1, @card_2, @card_3], deck.cards
  end

  def test_it_counts
    deck = Deck.new([@card_1, @card_2, @card_3])

    assert_equal 3, deck.count
  end
end
