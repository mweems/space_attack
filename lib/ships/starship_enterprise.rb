module Ships
	class StarshipEnterprise < Spaceship
		include Attributes::LastChance
		include Attributes::Evade
		ATTACK = 6
		DEFENSE = 20
		def initialize
			super(ATTACK, DEFENSE)
		end
	end
end