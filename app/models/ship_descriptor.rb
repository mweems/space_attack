class ShipDescriptor
	attr_reader :attack, :defense, :display_name
	def initialize(ship_class)
		@attack = ship_class::ATTACK
		@defense = ship_class::DEFENSE
		@display_name = ship_class.name.split(":").last
	end
end