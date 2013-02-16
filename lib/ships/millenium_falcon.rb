module Ships
	class MilleniumFalcon < Spaceship
		include Attributes::Charge
		include Attributes::Evade

		def initialize
			super(6, 20)
		end
	end
end