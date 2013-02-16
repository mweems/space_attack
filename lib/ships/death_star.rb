module Ships
	class DeathStar < Spaceship
		include Attributes::SuperShot

		def initialize
			super(8, 30)
		end
	end
end