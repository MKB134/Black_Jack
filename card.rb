# frozen_string_literal: true

class Card
  SUITS = %w[♠ ♥ ♣ ♦].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze

  attr_reader :score, :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
    @score = calculate_score(value)
  end

  def face
    "#{@suit}#{@value}"
  end

  def ace?
    @value == 'A'
  end

  private

  def calculate_score(value)
    if ace?
      11
    elsif 'JQK'.include?(value.to_s)
      10
    else
      value.to_i
    end
  end
end
