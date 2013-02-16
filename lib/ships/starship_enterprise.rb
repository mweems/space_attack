module Ships
	class StarshipEnterprise < Spaceship
		include Attributes::LastChance
		include Attributes::Evade

		def initialize
			super(6, 20)
		end
	end
end