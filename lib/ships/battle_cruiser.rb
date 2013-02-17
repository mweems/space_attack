module Ships
	class BattleCruiser < Spaceship
		ATTACK = 6
		DEFENSE = 25
		def initialize
			super(ATTACK, DEFENSE)
		end
	end
end