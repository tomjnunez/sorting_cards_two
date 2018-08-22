require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/guess'
require './lib/card'
require './lib/deck'

class RoundTest < Minitest::Test
  def setup
      @card_1 = Card.new('3', 'Hearts')
      @card_2 = Card.new('4', 'Clubs')
      @card_3 = Card.new('5', 'Diamonds')
  end

  def test_it_exists
    deck = Deck.new([@card_1, @card_2, @card_3])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    deck = Deck.new([@card_1, @card_2, @card_3])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_it_starts_without_a_guess
    deck = Deck.new([@card_1, @card_2, @card_3])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_has_a_current_card
    deck = Deck.new([@card_1, @card_2, @card_3])
    round = Round.new(deck)

    assert_instance_of Card, round.current_card
  end

  def test_it_records_guess
    deck = Deck.new([@card_1, @card_2, @card_3])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})

    assert_equal "3 of Hearts", guess.response
    assert_equal @card_1, guess.card
  end

  def test_it_can_total_correct_guesses
    deck = Deck.new([@card_1, @card_2, @card_3])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})

    assert_equal 1, round.number_correct
  end

  def test_card_shift
    deck = Deck.new([@card_1, @card_2, @card_3])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})

    assert_equal @card_2, round.current_card
  end

  def test_percent_correct
    deck = Deck.new([@card_1, @card_2, @card_3])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    round.record_guess({value: "5", suit: "Hearts"})


    assert_equal 50, round.percent_correct
  end
end
