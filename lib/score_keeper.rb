class ScoreKeeper
	def self.score(attacker_ships, defender_ships)
		resolve_battles(attacker_ships, defender_ships)
	end

	private

	def self.resolve_battles(attacker_ships, defender_ships)
		battle_result = attacker_ships.zip(defender_ships).map do |(attacker, defender)|
			if(attacker.nil? || defender.nil?)
				[attacker, defender]
			elsif defender.attack == 0 || 
				  ((defender.defense.to_f / attacker.attack) <= (attacker.defense.to_f / defender.attack))
				[attacker, nil]
			else
				[nil, defender]
			end
		end



		remaining_attackers = battle_result.map(&:first).compact
		remaining_defenders = battle_result.map(&:last).compact
		Result.new(0,0, remaining_attackers, remaining_defenders)
	end
end 
