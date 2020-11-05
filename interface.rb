class Interface
  attr_reader :deck
  attr_accessor :game_bank

	def initialize
    @game_bank = Game::BET * 2
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
    puts "1. Взять карту"
    puts "2. Открыть карты"
    puts "3. Пропустить ход"
    puts "4. Следующий раунд"
    case gets.chomp
    when '1'
      @game.player.take_card(@game.deck)
      show_information
      if @game.player.score > 21
        dealer_win
      end
    when '2'
      complete_round
    when '3'
      complete_round
    when '4. следующий раунд'
      new_round
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
    puts "Карты диллера: #{@game.dealer.cards.map(&:face).join(' ')} | очки : #{@game.dealer.score}"
    if @game.dealer.score == @game.player.score
      puts "Ничья!"
      player.increase_bank(@game_bank / 2)
      dealer.increase_bank(@game_bank / 2)
    elsif @game.player.score == 21
      player_win
    elsif @game.dealer.score == 21
      dealer_win
    elsif @game.player.score < 21 && @game.dealer.score < 21
      @game.player.score > @game.dealer.score ? player_win : dealer_win
    else
      @game.player.score > @game.dealer.score ? dealer_win : player_win
    end
  end

  def player_win
    @game.player.increase_bank(@game_bank)
    puts "Вы  выиграли!"
    puts "Ваш баланс: #{@game.player.bank}"
  end

  def dealer_win
    @game.dealer.increase_bank(@game_bank)
    puts "ВЫ проиграли!"
    puts "Ваш баланс: #{@game.player.bank}"
  end
  def new_round
    @game.first_round
  end
end
