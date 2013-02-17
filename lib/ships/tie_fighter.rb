module Ships
	class TieFighter < Spaceship
		ATTACK = 5
		DEFENSE = 8
		def initialize
			super(ATTACK, DEFENSE)
		end
	end
end