class ScoreKeeper
	def self.score(attacker_ships, defender_ships)
		remaining_attackers, remaining_defenders = resolve_battles(attacker_ships, defender_ships)
		Result.new(0,0, remaining_attackers, remaining_defenders)
	end

	private

	def self.resolve_battles(attacker_ships, defender_ships)
		attacker = attacker_ships.first
		defender = defender_ships.first
		return [attacker_ships, defender_ships] if attacker.nil? || defender.nil?

		while(attacker.alive? && defender.alive?)
			attacker.engage(defender)
			defender.engage(attacker)
		end

		if attacker.alive? && !defender.alive?
			defender_ships.shift
			resolve_battles(attacker_ships, defender_ships)
		elsif !attacker.alive? && defender.alive?
			attacker_ships.shift
			resolve_battles(attacker_ships, defender_ships)
		else
			attacker_ships.shift
			defender_ships.shift
			resolve_battles(attacker_ships, defender_ships)
		end


	end
end 
