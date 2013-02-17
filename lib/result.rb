class Result
	attr_reader :attacker_remaining_ships, :defender_remaining_ships

	def initialize(attacker_remaining_ships, defender_remaining_ships)
		@attacker_remaining_ships = attacker_remaining_ships
		@defender_remaining_ships = defender_remaining_ships
	end

	def winner
		return :player_1 if attacker_remaining_ships.length > 0
		:player_2
	end
end