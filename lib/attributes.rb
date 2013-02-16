module Attributes
	module FirstStrike
		def engage(enemy)
			enemy.deal_damage!(attack)
		end
	end

	module Evade
		def deal_damage!(damage)
			if rand < 0.5
				@defense = @defense - damage
			end
		end
	end
end