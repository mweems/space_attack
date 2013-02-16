require 'test/unit'
require 'space_attack'

class FleetBuilderTest < Test::Unit::TestCase
	def test_builds_fleet_with_specified_ships
		ships = ["XWing", "BorgCube", "BorgCube"]

		fleet = FleetBuilder.build(ships)
		fleet_classes = fleet.map(&:class)
		assert_equal [Ships::XWing, Ships::BorgCube, Ships::BorgCube], fleet_classes
	end
end
