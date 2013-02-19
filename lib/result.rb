class Result
	attr_reader :attacker_remaining_ships, :defender_remaining_ships

	def initialize(attacker_remaining_ships, defender_remaining_ships)
		@attacker_remaining_ships = attacker_remaining_ships
		@defender_remaining_ships = defender_remaining_ships
	end

	def winner	
		x = @attacker_remaining_ships#.to_s /Ships::\w*/
						 
		return "Player 1" if attacker_remaining_ships.length > 0
		"Player 2"
	end
end