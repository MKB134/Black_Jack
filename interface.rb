class Interface
  attr_reader :cards, :game_bank
  attr_accessor  :deck, :cards

	def initialize
    @cards = cards
    @game_bank = Game::BET * 2
    @deck = deck
    @game = Game.new(introduction)
    start

  end

  def introduction
    print 'Введите своё имя: '
    gets.chomp
  end

  def start
    @game.first_round
    step
  end

  def show_information
    puts "Ваше имя: #{@game.player.name}"
    puts "Ваш баланс: #{@game.player.bank}"
    puts "Ваши карты: #{@game.player.cards.map(&:face).join(' ')} | Очки: #{@game.player.score}"
    puts "Ставка: #{Game::BET}"
  end

  def step
    show_information
    puts "1. Взять карту"
    puts "2. Открыть карты"
    puts "3. Пропустить ход"
    case gets.chomp
    when '1'
      @game.player.take_card(@game.deck)
      show_information
      round_winner
      one_more_game
    when '2'
      round_winner
      one_more_game
    when '3'
      show_information
      one_more_game
    else
      puts 'Введена неправильная команда'
      step
    end
  end

  def round_winner
    puts "Победил в этом раунде #{@game.winner.name}"
    puts "Ваши карты: #{@game.player.cards.map(&:face).join(' ')} | Очки: #{@game.player.score}"
    puts "Карты диллера: #{@game.dealer.cards.map(&:face).join(' ')} | очки : #{@game.dealer.score}"
    @game.money_to_winner
    puts "Баланс Диллера: #{@game.dealer.bank}"
  end

  def one_more_game
    puts 'хотите еще раз сыграть? ( y / n )'
    case gets.chomp
    when 'y'
      @game.player_clear_cards
      @game.first_round
      step
    when 'n'
      exit
    end
  end
end
