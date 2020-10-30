class User
	attr_reader :cards, :bank
 
	def initialize(cards, bank)
		@cards = cards
		@bank = bank
	end
	def add_card(card)
		@cards.push card
	end
	def increase_bank(bet)
		bank += bet
	end
	def decrease_bank(bet)
		bank -= bet
	end
	

end
