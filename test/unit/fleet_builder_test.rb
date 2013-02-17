require 'test_helper'

class FleetBuilderTest < Test::Unit::TestCase
	def test_builds_fleet_with_specified_ships
		ships = ["XWing", "BorgCube", "BorgCube"]

		fleet = FleetBuilder.build(ships)
		fleet_classes = fleet.map(&:class)
		assert_equal [Ships::XWing, Ships::BorgCube, Ships::BorgCube], fleet_classes
	end

	def test_assigns_fleet_to_each_ship
		ships = ["XWing", "BorgCube", "BorgCube"]

		fleet = FleetBuilder.build(ships)
		fleet.each do |ship|
			assert_equal fleet, ship.fleet
		end
	end
end
