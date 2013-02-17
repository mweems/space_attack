module Ships
	class BorgCube < Spaceship
		include Attributes::Assimilate
		ATTACK = 8
		DEFENSE = 30
		def initialize
			super(ATTACK, DEFENSE)
		end
	end
end