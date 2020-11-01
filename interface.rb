class Interface
	def initialize
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
    case gets.chomp
    when '1'
      @game.player.take_card(@game.deck)
      show_information
      complete_round
    when '2'
    when '3'
    else
      puts 'Введена неправильная команда'
      step
    end
  end

  def complete_round
    # Завершает раунд
    # 1. Выводить данные (показывает счёт и карты у диллера)
    # 2. Определяет победителя (победителю начисляется выигрыш)
    # 3. Перезапуск раунда (очищение всех карт, создание новой колоды)
  end
end
