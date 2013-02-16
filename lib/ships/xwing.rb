module Ships
	class XWing < Spaceship
		include Attributes::FirstStrike
		include Attributes::Evade

		def initialize
			super(10,8)
		end
	end
end