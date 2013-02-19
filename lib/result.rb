class Result
	attr_reader :attacker_remaining_ships, :defender_remaining_ships, :winning_ships

	def initialize(attacker_remaining_ships, defender_remaining_ships)
		@attacker_remaining_ships = attacker_remaining_ships
		@defender_remaining_ships = defender_remaining_ships
		@winning_ships = []
	end
	
	def winner	
		if attacker_remaining_ships.length > 0
			@winning_ships = @attacker_remaining_ships
			return "Player 1"
		else
			@winning_ships = @defender_remaining_ships
			return "Player 2"
		end
	end
end