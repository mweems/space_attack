module Ships
	class MilleniumFalcon < Spaceship
		include Attributes::Charge
		include Attributes::Evade
		ATTACK = 6
		DEFENSE = 20
		def initialize
			super(ATTACK, DEFENSE)
		end
	end
end