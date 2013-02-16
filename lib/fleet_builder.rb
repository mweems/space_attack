class FleetBuilder

	def self.build(ships)
		ships.map { |ship| Ships.const_get(ship).new}
	end
end