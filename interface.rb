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
    show_information
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
    puts "4. Следующий раунд"
    case gets.chomp
    when '1'
      @game.player.take_card(@game.deck)
      show_information
      complete_round
    when '2'
      complete_round
      one_more_game
    when '3'
      show_information
    when '4'
      one_more_game
    else
      puts 'Введена неправильная команда'
      step
    end
  end
  # Завершает раунд
  # 1. Выводить данные (показывает счёт и карты у диллера)
  # 2. Определяет победителя (победителю начисляется выигрыш)
  # 3. Перезапуск раунда (очищение всех карт, создание новой колоды
  def complete_round
    if @game.dealer.score == @game.player.score
      puts "Ничья!"
      @game.player.increase_bank(@game_bank / 2)
      @game.dealer.increase_bank(@game_bank / 2)
    elsif 
      round_winner
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
