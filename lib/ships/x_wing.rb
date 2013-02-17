module Ships
	class XWing < Spaceship
		ATTACK = 8
		DEFENSE = 8
		include Attributes::FirstStrike
		include Attributes::Evade

		def initialize
			super(ATTACK, DEFENSE)
		end
	end
end