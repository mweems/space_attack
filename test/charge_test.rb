require 'test/unit'
require 'space_attack'

class ChargeTest < Test::Unit::TestCase
	def test_charge_increases_damage_sometimes
		100.times do |variable|
			ship1 = Spaceship.new(1,1)
			ship1.extend(Attributes::Charge)
			ship2 = Spaceship.new(1,2)
			ship2.engage(ship1)
			ship2.engage(ship1)
			return if ship1.defense == 2
		end
		fail "Ships defense never increased"
			
		
		
	end

end