class User
	attr_reader  :bank, :name, :score
	attr_accessor :cards
	BANK_AMOUNT = 100

	def initialize(name)
		@name = name
		@score = 0
		@cards = []
		@bank = BANK_AMOUNT
	end

	def add_card(card)
		@cards.push(card)
	end

	def increase_bank(bet)
		@bank += bet
	end

	def decrease_bank(bet)
		@bank -= bet
	end

	def make_bet(bet)
		decrease_bank(bet)
	end

	def take_card(deck)
		@cards << deck.give_card
		calculate_score
	end

	def calculate_score
		@score = @cards.sum(&:score)
		@cards.select(&:ace?).each do |card|
			@score -= 10 if @score > 21
		end
	end
end
