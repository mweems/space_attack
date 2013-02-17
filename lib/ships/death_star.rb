module Ships
	class DeathStar < Spaceship
		include Attributes::SuperShot
			ATTACK = 8
			DEFENSE = 30
		def initialize
			super(ATTACK, DEFENSE)
		end
	end
end