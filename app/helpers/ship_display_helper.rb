module ShipDisplayHelper

	def ship_descriptors
		ship_classes = [Ships::TieFighter, Ships::XWing, Ships::StarshipEnterprise,
							Ships::MilleniumFalcon, Ships::BattleCruiser, Ships::BorgCube,
							Ships::DeathStar]

		ship_classes.map { |ship_class| ShipDescriptor.new(ship_class) }
	end
	
	def display_info_for_ship_type(ship_type)
		name = ship_type.name.split(":").last
		"#{name}  :  Attack #{ship_type::ATTACK} - Defense #{ship_type::DEFENSE}"
	end
end