class Game
  attr_reader :player, :dealer, :deck 
  attr_accessor :cards, :game_bank, :bank
  BET = 10

  def initialize(name)
    @player = User.new(name)
    @dealer = User.new('Дилер')
    @game_bank = Game::BET * 2
    @bank = bank
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
  @dealer.cards = []
  @player.cards = []
  end

  def score_limit?(user)
    user.score > 21
  end

  def winner
    if score_limit? (@player)
      @dealer
    elsif score_limit? (@dealer)
      @player
    elsif @player.score != @dealer.score 
      [@player, @dealer].max_by(&:score)
    end
  end

  def money_to_winner
    if winner
      winner.increase_bank(@game_bank)
      else  
        puts 'Ничья!'
        @player.increase_bank(@game_bank / 2)
        @dealer.increase_bank(@game_bank / 2)
      end
  end
end
