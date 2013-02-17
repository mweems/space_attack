class FleetBuilder
	def self.build(ships)
		fleet = ships.map { |ship| Ships.const_get(ship).new }
		fleet.each { |ship| ship.fleet = fleet }
	end
end