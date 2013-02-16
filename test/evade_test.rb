require 'test/unit'
require 'space_attack'

class EvadeTest < Test::Unit::TestCase
	def test_evade_avoids_damages_some_times
		100.times do 
			ship = Spaceship.new(1,1)
			ship.extend(Attributes::Evade)
			enemy = Spaceship.new(1,1)
			enemy.engage(ship)
			enemy.engage(ship)
			return if ship.alive?
		end
		fail "ship never evaded the enemy"

	end

end