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
			if rand < 0.2
				@defense = @defense + damage
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
			if @current_enemy == enemy
				enemy.dead!
			else
				super
			end
		end
	end
end