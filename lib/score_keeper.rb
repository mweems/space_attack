class ScoreKeeper
	def self.score(attacker_ships, defender_ships)
		remaining_attackers, remaining_defenders = resolve_battles(attacker_ships, defender_ships)
		Result.new(0,0, remaining_attackers, remaining_defenders)
	end

	private

	def self.resolve_battles(attacker_ships, defender_ships)
		attacker = attacker_ships.first
		defender = defender_ships.first

		if(attacker.nil? || defender.nil?)
			[attacker_ships, defender_ships]
		elsif attacker.attack_ship!(defender)
			resolve_battles(attacker_ships, defender_ships.drop(1))
		else
			resolve_battles(attacker_ships.drop(1), defender_ships)
		end
	end
end 
