
require 'test_helper'

class AssimilateTest < Test::Unit::TestCase
	def test_assimilate_sometimes_adds_another_ship_to_attackers_fleet
		assimilated = 0
		not_assimilated = 0
		100.times do
			attacker = Spaceship.new(1,1)
			attacker.extend(Attributes::Assimilate)
			attacker_fleet = [attacker]
			attacker.fleet = attacker_fleet
			defender = Spaceship.new(1,1)
			attacker.engage(defender)
			if attacker_fleet.length == 2
				assimilated += 1
			else
				not_assimilated += 1
			end
		end
		assert_not_equal 0, assimilated
		assert_not_equal 0, not_assimilated
	end

	def test_assimilate_kills_enemy_ship
		100.times do
			attacker = Spaceship.new(1,1)
			attacker.extend(Attributes::Assimilate)
			attacker_fleet = [attacker]
			attacker.fleet = attacker_fleet
			defender = Spaceship.new(1,1)
			attacker.engage(defender)
			return if !defender.alive?
		end
		fail "defender never died"
	end

	def test_assimilate_recieves_ship_equal_to_enemy_ship
		100.times do
			attacker = Spaceship.new(1,1)
			attacker.extend(Attributes::Assimilate)
			attacker_fleet = [attacker]
			attacker.fleet = attacker_fleet
			defender = Ships::XWing.new
			attacker.engage(defender)
			if(attacker_fleet.length == 2)
				new_ship = (attacker_fleet - [attacker]).first
				assert_equal Ships::XWing, new_ship.class
				return
			end
		end
	end

	def test_assimilate_adds_fleet_reference_to_assimilated_ship
			100.times do
				attacker = Spaceship.new(1,1)
				attacker.extend(Attributes::Assimilate)
				attacker_fleet = [attacker]
				attacker.fleet = attacker_fleet
				defender = Ships::XWing.new
				attacker.engage(defender)
				if(attacker_fleet.length == 2)
					new_ship = (attacker_fleet - [attacker]).first
					assert_equal attacker.fleet, new_ship.fleet
					return
				end
			end
	end
end