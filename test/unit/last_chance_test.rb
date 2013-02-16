require 'test/unit'
require 'space_attack'

class LastChanceTest < Test::Unit::TestCase
	def test_last_chance_test_saves_the_ship
		100.times do 
			ship = Spaceship.new(1,1)
			ship.extend(Attributes::LastChance)
			enemy = Spaceship.new(1,2)
			enemy.engage(ship)
			enemy.engage(ship)
			return if !enemy.alive?
		end
		fail "last chance shot never killed enemy"
	end

	def test_last_chance_never_fires_if_incoming_damage_isnt_fatal
		ship = Spaceship.new(1,2)
		ship.extend(Attributes::LastChance)
		enemy = Spaceship.new(1,2)
		enemy.engage(ship)
		enemy.engage(ship)
		assert_equal true, enemy.alive?
	end
	def test_ship_with_last_chance_receives_damage
		ship = Spaceship.new(1,2)
		ship.extend(Attributes::LastChance)
		enemy = Spaceship.new(1,2)
		enemy.engage(ship)
		enemy.engage(ship)
		assert_equal 1, ship.defense
	end

	def test_ship_with_last_chance_only_fires_sometimes	
		100.times do 
			ship = Spaceship.new(1,1)
			ship.extend(Attributes::LastChance)
			enemy = Spaceship.new(1,2)
			enemy.engage(ship)
			enemy.engage(ship)
			return if !ship.alive?
		end
		fail "last chance ship never dies"
	end
end