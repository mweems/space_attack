class Result
	attr_reader :attacker_score, :defender_score, 
				:attacker_remaining_ships, :defender_remaining_ships

	def initialize(attacker_score, defender_score, attacker_remaining_ships, defender_remaining_ships)
		@attacker_score = attacker_score
		@defender_score = defender_score
		@attacker_remaining_ships = attacker_remaining_ships
		@defender_remaining_ships = defender_remaining_ships
	end

	def winner
		return :attacker if attacker_remaining_ships.length > 0
		:defender
	end
end