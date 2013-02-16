require 'test/unit'
require 'space_attack'

class ChargeTest < Test::Unit::TestCase
	def test_charge_increases_damage_sometimes
		100.times do |variable|
			ship = Spaceship.new(1,1)
			ship.extend(Attributes::Charge)
			enemy = Spaceship.new(1,2)
			enemy.engage(ship)
			enemy.engage(ship)
			return if ship.defense == 2
		end
		fail "Ships defense never increased"
			
		
		
	end

end