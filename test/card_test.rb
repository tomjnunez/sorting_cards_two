require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_it_exists
    card = Card.new("Ace", "Spades")

    assert_instance_of Card, card
  end

  def test_it_has_a_value
    card = Card.new("8", "Hearts")

    assert_equal "8", card.value
  end

  def test_it_has_a_suit
    card = Card.new("King", "Clubs")

    assert_equal "Clubs", card.suit
  end
end
