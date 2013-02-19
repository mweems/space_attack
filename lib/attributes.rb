module Attributes
	module FirstStrike
		def engage(enemy)
			enemy.deal_damage!(attack, self)
		end
	end

	module Evade
		def deal_damage!(damage, enemy)
			if rand < 0.5
				super
			end
		end
	end

	module Charge
		def deal_damage!(damage, enemy)
			
			if rand < 0.15
				@defense = @defense + (damage / 2)
				if @defense > @start_defense
					@defense = @start_defense
				else
					@defense
				end
			else
				super	
			end
		end
	end

	module LastChance
		def deal_damage!(damage, enemy)
			if damage >= @defense && rand < 0.2
				enemy.deal_damage!(@attack * 2, self)
			else
				super
			end
		end
	end	

	module SuperShot
		def engage(enemy)
			if @current_enemy == enemy && rand < 0.22
				enemy.dead!
			else
				super
			end
		end
	end

	module Assimilate
		def engage(enemy)
			if rand < 0.03
				enemy.dead!
				new_ship = enemy.class.new
				new_ship.fleet = fleet
				fleet.push(new_ship)
			else
				super
			end
		end
	end
end