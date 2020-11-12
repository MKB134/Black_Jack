# frozen_string_literal: true

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.each do	|suit|
      Card::VALUES.each do |value|
        card = Card.new(suit, value)
        @cards.push card
      end
    end
    @cards.shuffle!
  end

  def give_card
    @cards.pop
  end
end
