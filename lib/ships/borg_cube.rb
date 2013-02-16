module Ships
	class BorgCube < Spaceship
		include Attributes::Assimilate

		def initialize
			super(8, 30)
		end
	end
end