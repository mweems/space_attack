module Ships
	class XWing < Spaceship
		include Attributes::FirstStrike
		include Attributes::Evade

		def initialize
			super(8, 8)
		end
	end
end