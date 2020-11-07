class Game
  attr_reader :player, :dealer, :deck, :cards
  BET = 10

  def initialize(name)
    @player = User.new(name)
    @dealer = User.new('Дилер')
  end

  def first_round
    @deck = Deck.new
    @player.make_bet(BET)
    @dealer.make_bet(BET)
    @player.take_card(@deck)
    @dealer.take_card(@deck)
    @player.take_card(@deck)
    @dealer.take_card(@deck)
  end
  def player_clear_cards
    @user.clean_hand
    @dealer.clean_hand
  end
end
