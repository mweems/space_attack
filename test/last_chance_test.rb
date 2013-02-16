require 'test/unit'
require 'space_attack'

class LastChanceTest < Test::Unit::TestCase
	def test_last_chance_test_saves_the_ship_sometimes
		100.times do 
			ship = Spaceship.new(1,1)
			ship.extend(Attributes::LastChance)
			enemy = Spaceship.new(1,2)
			enemy.engage(ship)
			enemy.engage(ship)
			return if enemy.alive? != true
		end
		fail "last chance shot never killed enemy"
	end
end