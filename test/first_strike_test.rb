require 'test/unit'
require 'space_attack'


class FirstStrikeTest < Test::Unit::TestCase
	def test_first_strike_engages_enemy_immediately
		ship = Spaceship.new(1,1)
		ship.extend(Attributes::FirstStrike)
		enemy = Spaceship.new(1,1)
		ship.engage(enemy)
		assert_equal false, enemy.alive?
	end
end