module Attributes
	module FirstStrike
		def engage(enemy)
			enemy.deal_damage!(attack, self)
		end
	end

	module Evade
		def deal_damage!(damage, enemy)
			if rand < 0.5
				@defense = @defense - damage
			end
		end
	end

	module Charge
		def deal_damage!(damage, enemy)
			if rand < 0.2
				@defense = @defense + damage
			else
				@defense = @defense - damage
			end
		end
	end

	module LastChance
		def deal_damage!(damage, enemy)
			if damage >= @defense && rand < 0.2
				enemy.deal_damage!(@attack * 2, self)
			else
				@defense = @defense - damage
			end
		end
	end	
end